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

# Step 3: Define Disk Configuration
$DiskName = "your-regional-disk-name"               # Replace with a unique name for your regional disk
$Region = "us-central1"                             # Specify the region for the disk
$DiskSizeGB = 100                                   # Define the size of the disk in GB
$DiskType = "pd-balanced"                           # Choose the disk type (pd-standard, pd-ssd, or pd-balanced)

Write-Host "Creating Multi-Zone Persistent Storage Disk $DiskName in region $Region..." -ForegroundColor Cyan

# Step 4: Create the Regional Persistent Disk
gcloud compute disks create $DiskName `
    --size=$DiskSizeGB `
    --type=$DiskType `
    --region=$Region `
    --replica-zones=$Region-a,$Region-b            # Specify the two zones within the same region

# Step 5: Verify the Regional Persistent Disk
Write-Host "Verifying the newly created Regional Persistent Disk..." -ForegroundColor Green
gcloud compute disks describe $DiskName --region=$Region
