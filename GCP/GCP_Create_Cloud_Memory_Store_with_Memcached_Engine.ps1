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

# Step 3: Define Cloud Memorystore Configuration
$InstanceName = "your-memcached-instance"               # Replace with a unique instance name
$Region = "us-central1"                                 # Specify the region for the instance
$NodeCount = 2                                          # Number of nodes for the Memcached cluster
$NodeSize = 1                                           # Memory size per node in GB
$Description = "Memcached instance for caching"         # Description of the instance

Write-Host "Creating Cloud Memorystore instance with Memcached engine named $InstanceName..." -ForegroundColor Cyan

# Step 4: Create the Cloud Memorystore Instance
gcloud memcache instances create $InstanceName `
    --region=$Region `
    --node-count=$NodeCount `
    --node-memory=$NodeSize `
    --description="$Description" `
    --memcache-version=MEMCACHE_1_5

# Step 5: Verify the Cloud Memorystore Instance
Write-Host "Verifying the newly created Cloud Memorystore instance..." -ForegroundColor Green
gcloud memcache instances describe $InstanceName --region=$Region
