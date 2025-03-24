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

# Step 3: Create a PostgreSQL Instance
$InstanceName = "your-postgres-instance"  # Replace with your instance name
$Region = "us-central1"                   # Replace with your desired region
$Tier = "db-f1-micro"                     # Choose the machine type (e.g., db-f1-micro)
$DatabaseVersion = "POSTGRES_13"          # Specify the PostgreSQL version

Write-Host "Creating PostgreSQL instance $InstanceName..." -ForegroundColor Cyan
gcloud sql instances create $InstanceName `
    --database-version=$DatabaseVersion `
    --tier=$Tier `
    --region=$Region

# Step 4: Set Root Password
$RootPassword = "your-secure-password"    # Replace with a secure password
Write-Host "Setting root password for the PostgreSQL instance..." -ForegroundColor Yellow
gcloud sql users set-password postgres --instance=$InstanceName --password=$RootPassword

# Step 5: Verify the Instance
Write-Host "Verifying the PostgreSQL instance..." -ForegroundColor Green
gcloud sql instances describe $InstanceName
