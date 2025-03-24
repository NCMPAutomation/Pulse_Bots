#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                     # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Instance Group Configuration
$InstanceGroupName = "your-instance-group-name"    # Replace with a unique name for the instance group
$Zone = "us-central1-a"                            # Specify the zone where the group will be created
$InstanceTemplate = "your-instance-template"       # Replace with the name of your instance template
$Size = 2                                          # Specify the initial size of the group

Write-Host "Creating a Managed Stateless Instance Group named $InstanceGroupName in $Zone..." -ForegroundColor Cyan

# Step 4: Create the Managed Instance Group
gcloud compute instance-groups managed create $InstanceGroupName `
    --base-instance-name=$InstanceGroupName `
    --size=$Size `
    --template=$InstanceTemplate `
    --zone=$Zone

# Step 5: Verify the Instance Group
Write-Host "Verifying the Managed Stateless Instance Group..." -ForegroundColor Green
gcloud compute instance-groups managed describe $InstanceGroupName --zone=$Zone
