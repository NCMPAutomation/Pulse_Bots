# Step 1: Assign Variables
$AdminCredential = Get-Credential               # Prompt for admin credentials
$ExchangeServer = "admin@yourdomain.com"        # Exchange Online administrator's email
$GroupName = "YourDistributionGroupName"        # Name of the distribution group
$UserEmail = "UserEmail@domain.com"             # User's email to be added or removed

# Step 2: Connect to Exchange Online
Write-Host "Connecting to Exchange Online..." -ForegroundColor Green
Connect-ExchangeOnline -UserPrincipalName $ExchangeServer -Credential $AdminCredential

# Step 3: Adding the User to the Distribution Group
Write-Host "Adding $UserEmail to $GroupName..." -ForegroundColor Yellow
Add-DistributionGroupMember -Identity $GroupName -Member $UserEmail

# Step 4: Verify Addition (Optional)
Write-Host "Verifying that $UserEmail is added to $GroupName..." -ForegroundColor Cyan
Get-DistributionGroupMember -Identity $GroupName | Where-Object {$_.PrimarySmtpAddress -eq $UserEmail}

# Step 5: Removing the User from the Distribution Group
Write-Host "Removing $UserEmail from $GroupName..." -ForegroundColor Yellow
Remove-DistributionGroupMember -Identity $GroupName -Member $UserEmail -Confirm:$false

# Step 6: Verify Removal (Optional)
Write-Host "Verifying that $UserEmail is removed from $GroupName..." -ForegroundColor Cyan
Get-DistributionGroupMember -Identity $GroupName | Where-Object {$_.PrimarySmtpAddress -eq $UserEmail}

# Step 7: Disconnect from Exchange Online
Write-Host "Disconnecting from Exchange Online..." -ForegroundColor Green
Disconnect-ExchangeOnline -Confirm:$false

Write-Host "Script execution completed." -ForegroundColor Magenta
