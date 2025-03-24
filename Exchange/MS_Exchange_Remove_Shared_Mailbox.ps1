# Step 1: Assign Variables
$AdminCredential = Get-Credential                         # Prompt for admin credentials
$SharedMailboxName = "SharedMailboxName"                  # Name or email of the shared mailbox to be removed

# Step 2: Connect to Exchange Online
Write-Host "Connecting to Exchange Online..." -ForegroundColor Green
Connect-ExchangeOnline -Credential $AdminCredential

# Step 3: Remove the Shared Mailbox
Write-Host "Removing the shared mailbox: $SharedMailboxName..." -ForegroundColor Yellow
Remove-Mailbox -Identity $SharedMailboxName -Confirm:$false

# Step 4: Verify Removal
Write-Host "Verifying that the shared mailbox has been removed..." -ForegroundColor Cyan
Get-Mailbox -Identity $SharedMailboxName -ErrorAction SilentlyContinue

# Step 5: Disconnect from Exchange Online
Write-Host "Disconnecting from Exchange Online..." -ForegroundColor Green
Disconnect-ExchangeOnline -Confirm:$false

Write-Host "Script execution completed." -ForegroundColor Magenta
