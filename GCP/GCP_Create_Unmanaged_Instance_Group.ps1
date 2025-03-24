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

# Step 3: Define Instance Group Configuration
$InstanceGroupName = "your-unmanaged-group-name"       # Replace with a unique name for your group
$Zone = "us-central1-a"                                # Specify the zone for the group

Write-Host "Creating an Unmanaged Instance Group named $InstanceGroupName in $Zone..." -ForegroundColor Cyan

# Step 4: Create the Unmanaged Instance Group
gcloud compute instance-groups unmanaged create $InstanceGroupName `
    --zone=$Zone

# Step 5: Add Instances to the Group (Optional)
$InstanceName1 = "instance-1"                          # Replace with the name of an existing instance
$InstanceName2 = "instance-2"                          # Replace with the name of another existing instance
Write-Host "Adding instances to the Unmanaged Instance Group..." -ForegroundColor Yellow
gcloud compute instance-groups unmanaged add-instances $InstanceGroupName `
    --instances=$InstanceName1,$InstanceName2 `
    --zone=$Zone

# Step 6: Verify the Unmanaged Instance Group
Write-Host "Verifying the Unmanaged Instance Group configuration..." -ForegroundColor Green
gcloud compute instance-groups describe $InstanceGroupName --zone=$Zone
