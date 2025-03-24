# Step 1: Assign Variables
$AdminCredential = Get-Credential                    # Prompt for admin credentials
$GroupName = "YourDistributionGroupName"             # Name of the distribution group
$Alias = "DistributionGroupAlias"                    # Alias for the group
$PrimarySMTPAddress = "groupname@yourdomain.com"      # Primary email address for the group
$Description = "This is a sample distribution group." # Description of the group
$OrganizationalUnit = "OU=Groups,DC=yourdomain,DC=com" # Organizational Unit (Optional)

# Step 2: Connect to Exchange Online
Write-Host "Connecting to Exchange Online..." -ForegroundColor Green
Connect-ExchangeOnline -Credential $AdminCredential

# Step 3: Create the Distribution Group
Write-Host "Creating the distribution group: $GroupName..." -ForegroundColor Yellow
New-DistributionGroup -Name $GroupName -Alias $Alias -PrimarySmtpAddress $PrimarySMTPAddress `
-OrganizationalUnit $OrganizationalUnit -Type Distribution -Description $Description

# Step 4: Verify the Group Creation
Write-Host "Verifying the newly created distribution group..." -ForegroundColor Cyan
Get-DistributionGroup -Identity $GroupName

# Step 5: Disconnect from Exchange Online
Write-Host "Disconnecting from Exchange Online..." -ForegroundColor Green
Disconnect-ExchangeOnline -Confirm:$false

Write-Host "Script execution completed." -ForegroundColor Magenta
