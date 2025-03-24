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

# Step 3: Create a MySQL Server Instance
$InstanceName = "your-mysql-instance"         # Replace with your MySQL instance name
$Region = "us-central1"                       # Replace with your desired region
$Tier = "db-n1-standard-1"                    # Choose machine type (e.g., db-n1-standard-1)
$DatabaseVersion = "MYSQL_8_0"                # Specify the MySQL version

Write-Host "Creating MySQL instance $InstanceName..." -ForegroundColor Cyan
gcloud sql instances create $InstanceName `
    --database-version=$DatabaseVersion `
    --tier=$Tier `
    --region=$Region

# Step 4: Set Root Password
$RootPassword = "your-secure-password"        # Replace with a secure password
Write-Host "Setting root password for the MySQL instance..." -ForegroundColor Yellow
gcloud sql users set-password root --host=% --instance=$InstanceName --password=$RootPassword

# Step 5: Verify the Instance
Write-Host "Verifying the MySQL instance..." -ForegroundColor Green
gcloud sql instances describe $InstanceName
