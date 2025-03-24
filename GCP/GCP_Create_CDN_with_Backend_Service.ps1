#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                        # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define CDN Configuration
$BackendServiceName = "your-backend-service-name"     # Replace with your backend service name
$CDNPolicyName = "your-cdn-policy-name"               # Replace with a unique name for the CDN policy

Write-Host "Enabling Cloud CDN for the backend service $BackendServiceName..." -ForegroundColor Cyan

# Step 4: Enable Cloud CDN for the Backend Service
gcloud compute backend-services update $BackendServiceName `
    --enable-cdn `
    --global

# Step 5: Verify CDN Configuration
Write-Host "Verifying the Cloud CDN configuration..." -ForegroundColor Green
gcloud compute backend-services describe $BackendServiceName --global
