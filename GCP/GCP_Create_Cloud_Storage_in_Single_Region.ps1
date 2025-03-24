#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"              # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Bucket Configuration
$BucketName = "your-unique-bucket-name"     # Replace with a globally unique bucket name
$Region = "us-central1"                     # Replace with your desired single region
$StorageClass = "STANDARD"                  # Choose storage class: STANDARD, NEARLINE, COLDLINE, or ARCHIVE

Write-Host "Creating Cloud Storage bucket $BucketName in $Region..." -ForegroundColor Cyan

# Step 4: Create the Storage Bucket
gcloud storage buckets create $BucketName `
    --location=$Region `
    --storage-class=$StorageClass

# Step 5: Verify the Bucket
Write-Host "Verifying the newly created Cloud Storage bucket..." -ForegroundColor Green
gcloud storage buckets describe $BucketName
