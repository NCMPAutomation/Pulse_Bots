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
$DiskName = "your-disk-name"                        # Replace with a unique name for your persistent disk
$Zone = "us-central1-a"                             # Specify the zone for the disk
$DiskSizeGB = 100                                   # Specify the size of the disk in GB
$DiskType = "pd-balanced"                           # Choose the type of disk (pd-standard, pd-ssd, or pd-balanced)

Write-Host "Creating Persistent Storage Disk $DiskName in zone $Zone..." -ForegroundColor Cyan

# Step 4: Create the Persistent Disk
gcloud compute disks create $DiskName `
    --size=$DiskSizeGB `
    --type=$DiskType `
    --zone=$Zone

# Step 5: Verify the Persistent Disk
Write-Host "Verifying the newly created Persistent Disk..." -ForegroundColor Green
gcloud compute disks describe $DiskName --zone=$Zone
