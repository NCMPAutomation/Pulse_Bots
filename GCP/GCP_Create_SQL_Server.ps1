#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud


# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"               # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Create a SQL Server Instance
$InstanceName = "your-sqlserver-instance"    # Replace with your SQL Server instance name
$Region = "us-central1"                      # Replace with your desired region
$Tier = "db-custom-2-3840"                   # Choose a machine type (e.g., custom config: db-custom-2-3840)
$DatabaseVersion = "SQLSERVER_2019_STANDARD" # Specify the SQL Server version (e.g., 2017, 2019, etc.)

Write-Host "Creating SQL Server instance $InstanceName..." -ForegroundColor Cyan
gcloud sql instances create $InstanceName `
    --database-version=$DatabaseVersion `
    --tier=$Tier `
    --region=$Region

# Step 4: Set Root Password
$RootPassword = "your-secure-password"       # Replace with a secure password
Write-Host "Setting root password for the SQL Server instance..." -ForegroundColor Yellow
gcloud sql users set-password sqlserver --instance=$InstanceName --password=$RootPassword

# Step 5: Verify the Instance
Write-Host "Verifying the SQL Server instance..." -ForegroundColor Green
gcloud sql instances describe $InstanceName
