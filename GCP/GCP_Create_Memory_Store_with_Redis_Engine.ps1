#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                         # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Redis Instance Configuration
$InstanceName = "your-redis-instance"                  # Replace with a unique name for the Redis instance
$Region = "us-central1"                                # Specify the region where the instance will be created
$Tier = "BASIC"                                        # Specify tier: BASIC or STANDARD_HA
$MemorySizeGB = 1                                      # Memory size in GB for the Redis instance

Write-Host "Creating Cloud Memorystore for Redis instance named $InstanceName..." -ForegroundColor Cyan

# Step 4: Create the Redis Instance
gcloud redis instances create $InstanceName `
    --region=$Region `
    --tier=$Tier `
    --size=$MemorySizeGB

# Step 5: Verify the Redis Instance
Write-Host "Verifying the newly created Redis instance..." -ForegroundColor Green
gcloud redis instances describe $InstanceName --region=$Region
