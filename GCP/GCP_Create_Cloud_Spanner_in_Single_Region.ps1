#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                          # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Cloud Spanner Configuration
$InstanceName = "your-spanner-instance"                 # Replace with a unique instance name
$Config = "regional-us-central1"                       # Specify the region configuration (e.g., regional-us-central1)
$NodeCount = 1                                         # Define the number of nodes (or processing units)
$Description = "Cloud Spanner instance for a single region" # Description of the instance

Write-Host "Creating a Cloud Spanner instance named $InstanceName in configuration $Config..." -ForegroundColor Cyan

# Step 4: Create the Cloud Spanner Instance
gcloud spanner instances create $InstanceName `
    --config=$Config `
    --nodes=$NodeCount `
    --description="$Description"

# Step 5: Verify the Cloud Spanner Instance
Write-Host "Verifying the newly created Cloud Spanner instance..." -ForegroundColor Green
gcloud spanner instances describe $InstanceName
