#Install module if not installed
Install-Module GoogleCloud
#Import Module
Import-Module GoogleCloud


# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"  # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Create a Filestore Instance
$InstanceName = "your-filestore-instance"  # Replace with your Filestore instance name
$Zone = "us-central1-a"                    # Replace with your desired zone
$Tier = "STANDARD"                         # Choose STANDARD or PREMIUM
$Capacity = "1TB"                          # Specify capacity (e.g., 1TB)

Write-Host "Creating Filestore instance $InstanceName..." -ForegroundColor Cyan
gcloud filestore instances create $InstanceName `
    --zone=$Zone `
    --tier=$Tier `
    --file-share=name="vol1",capacity=$Capacity `
    --network=name="default"

# Step 4: Verify the Instance
Write-Host "Verifying the Filestore instance..." -ForegroundColor Green
gcloud filestore instances describe $InstanceName --zone=$Zone
