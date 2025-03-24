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

# Step 3: Create a Virtual Private Cloud (VPC)
$NetworkName = "your-vpc-network"                  # Replace with a unique VPC name
Write-Host "Creating a Virtual Private Cloud (VPC) named $NetworkName..." -ForegroundColor Cyan
gcloud compute networks create $NetworkName `
    --subnet-mode=custom

# Step 4: Create a Subnetwork
$SubnetworkName = "your-subnetwork"                # Replace with a unique subnetwork name
$Region = "us-central1"                            # Specify the region for the subnetwork
$IPRange = "10.0.0.0/24"                           # Define the IP range for the subnetwork
Write-Host "Creating a Subnetwork $SubnetworkName in $Region..." -ForegroundColor Yellow
gcloud compute networks subnets create $SubnetworkName `
    --network=$NetworkName `
    --region=$Region `
    --range=$IPRange

# Step 5: Create a Compute Engine Virtual Machine (VM) Instance
$VMName = "your-vm-instance"                       # Replace with a unique VM name
$Zone = "us-central1-a"                            # Specify the zone for the VM
$MachineType = "e2-micro"                          # Choose the machine type
$ImageFamily = "debian-11"                         # Replace with the image family (e.g., debian-11)
$ImageProject = "debian-cloud"                     # Specify the image project (e.g., debian-cloud)
Write-Host "Creating a Compute Engine VM instance $VMName in $Zone..." -ForegroundColor Cyan
gcloud compute instances create $VMName `
    --zone=$Zone `
    --machine-type=$MachineType `
    --subnet=$SubnetworkName `
    --image-family=$ImageFamily `
    --image-project=$ImageProject

# Step 6: Create a Storage Bucket
$BucketName = "your-storage-bucket"                # Replace with a globally unique bucket name
$Location = "US"                                   # Specify the multi-region or region for the bucket
Write-Host "Creating a Cloud Storage Bucket named $BucketName in $Location..." -ForegroundColor Yellow
gcloud storage buckets create $BucketName `
    --location=$Location

# Step 7: Verify the Resources
Write-Host "Verifying the created resources..." -ForegroundColor Green
Write-Host "Listing VPC Networks:" -ForegroundColor Cyan
gcloud compute networks list

Write-Host "Listing Compute Engine Instances:" -ForegroundColor Cyan
gcloud compute instances list

Write-Host "Listing Storage Buckets:" -ForegroundColor Cyan
gcloud storage buckets list
