#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                      # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Cloud NAT Configuration
$NatGatewayName = "your-nat-gateway-name"           # Replace with a unique name for the NAT Gateway
$Region = "us-central1"                             # Specify the region for the NAT Gateway
$RouterName = "your-router-name"                    # Replace with the name of the Cloud Router

Write-Host "Creating Cloud NAT Gateway $NatGatewayName in $Region using router $RouterName..." -ForegroundColor Cyan

# Step 4: Create the NAT Gateway
gcloud compute routers nats create $NatGatewayName `
    --router=$RouterName `
    --region=$Region `
    --nat-all-subnet-ip-ranges `
    --auto-allocate-nat-external-ips

# Step 5: Verify the NAT Gateway
Write-Host "Verifying the NAT Gateway configuration..." -ForegroundColor Green
gcloud compute routers nats describe $NatGatewayName --router=$RouterName --region=$Region
