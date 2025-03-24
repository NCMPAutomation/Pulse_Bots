#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                    # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Virtual Network Configuration
$NetworkName = "your-vpc-network"                 # Replace with a unique name for your VPC
$SubnetworkName = "your-subnetwork"               # Replace with a name for your subnetwork
$Region = "us-central1"                           # Specify the region
$IPRange = "10.0.0.0/24"                          # Define the IP range for the subnetwork

Write-Host "Creating Virtual Network (VPC) named $NetworkName..." -ForegroundColor Cyan

# Step 4: Create the Virtual Network
gcloud compute networks create $NetworkName `
    --subnet-mode=custom

# Step 5: Create a Subnetwork in the VPC
Write-Host "Creating a Subnetwork $SubnetworkName in $Region..." -ForegroundColor Yellow
gcloud compute networks subnets create $SubnetworkName `
    --network=$NetworkName `
    --region=$Region `
    --range=$IPRange

# Step 6: Set Up DDoS Protection (Cloud Armor)
$BackendServiceName = "your-backend-service"      # Replace with the name of your backend service
$SecurityPolicyName = "ddos-protection-policy"    # Replace with a unique name for the security policy

Write-Host "Creating a Cloud Armor security policy for DDoS protection..." -ForegroundColor Cyan
gcloud compute security-policies create $SecurityPolicyName `
    --description="DDoS Protection Policy"

Write-Host "Adding default DDoS protection rules to $SecurityPolicyName..." -ForegroundColor Yellow
gcloud compute security-policies rules create 1000 `
    --security-policy=$SecurityPolicyName `
    --expression="evaluate_traffic()" `
    --action="deny-403" `
    --description="Block malicious traffic"

Write-Host "Attaching the security policy to the backend service $BackendServiceName..." -ForegroundColor Cyan
gcloud compute backend-services update $BackendServiceName `
    --security-policy=$SecurityPolicyName `
    --global

# Step 7: Verify Configuration
Write-Host "Verifying the Virtual Network and DDoS Protection setup..." -ForegroundColor Green
gcloud compute networks describe $NetworkName
gcloud compute security-policies describe $SecurityPolicyName
