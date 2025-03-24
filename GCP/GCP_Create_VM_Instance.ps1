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

# Step 3: Define VM Configuration
$InstanceName = "your-vm-instance-name"      # Replace with your VM instance name
$Zone = "us-central1-a"                      # Specify the zone for the VM
$MachineType = "e2-micro"                    # Choose the machine type (e.g., e2-micro, n1-standard-1)
$ImageFamily = "debian-11"                   # Replace with your desired image family (e.g., debian-11, ubuntu-2004-lts)
$ImageProject = "debian-cloud"               # Replace with the image project (e.g., debian-cloud, ubuntu-os-cloud)
$DiskSize = "10GB"                           # Specify the boot disk size

Write-Host "Creating VM instance $InstanceName in $Zone..." -ForegroundColor Cyan

# Step 4: Create the VM Instance
gcloud compute instances create $InstanceName `
    --zone=$Zone `
    --machine-type=$MachineType `
    --image-family=$ImageFamily `
    --image-project=$ImageProject `
    --boot-disk-size=$DiskSize

# Step 5: Verify the VM Instance
Write-Host "Verifying the VM instance creation..." -ForegroundColor Green
gcloud compute instances describe $InstanceName --zone=$Zone
