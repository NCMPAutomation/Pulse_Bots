#Install module if not found

Install-Module GoogleCloud
# Import module

Import-Module GoogleCloud

# Step 1: Authenticate with GCP
Write-Host "Authenticating with Google Cloud..." -ForegroundColor Green
gcloud auth login

# Step 2: Set the GCP Project
$ProjectID = "your-project-id"                   # Replace with your GCP project ID
Write-Host "Setting the GCP project to $ProjectID..." -ForegroundColor Yellow
gcloud config set project $ProjectID

# Step 3: Define Public Cloud DNS Zone Configuration
$ZoneName = "your-public-dns-zone"              # Replace with a unique name for the DNS zone
$DNSName = "example.com."                       # Replace with your domain name (must end with a dot)
$Description = "Public DNS Zone for example.com" # Description for the DNS zone

Write-Host "Creating a public Cloud DNS zone named $ZoneName..." -ForegroundColor Cyan

# Step 4: Create the Public DNS Zone
gcloud dns managed-zones create $ZoneName `
    --dns-name=$DNSName `
    --description="$Description"

# Step 5: Add DNS Records to the Zone
# Example: Adding an A record
$RecordType = "A"
$TTL = 300                                        # TTL in seconds
$IPAddress = "192.0.2.1"                         # Replace with the IP address for the A record
Write-Host "Adding an A record to $ZoneName for $DNSName..." -ForegroundColor Yellow
gcloud dns record-sets transaction start --zone=$ZoneName
gcloud dns record-sets transaction add $IPAddress `
    --name=$DNSName `
    --ttl=$TTL `
    --type=$RecordType `
    --zone=$ZoneName
gcloud dns record-sets transaction execute --zone=$ZoneName

# Step 6: Verify the Zone and Records
Write-Host "Verifying the DNS zone and records..." -ForegroundColor Green
gcloud dns managed-zones describe $ZoneName
gcloud dns record-sets list --zone=$ZoneName
