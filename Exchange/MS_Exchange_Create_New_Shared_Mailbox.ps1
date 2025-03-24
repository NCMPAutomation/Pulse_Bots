# Step 1: Assign Variables
$AdminCredential = Get-Credential                         # Prompt for admin credentials
$SharedMailboxName = "NewSharedMailbox"                   # Name of the shared mailbox
$Alias = "SharedMailboxAlias"                             # Alias for the mailbox
$PrimarySMTPAddress = "sharedmailbox@yourdomain.com"       # Primary email address for the mailbox

# Step 2: Connect to Exchange Online
Write-Host "Connecting to Exchange Online..." -ForegroundColor Green
Connect-ExchangeOnline -Credential $AdminCredential

# Step 3: Create the Shared Mailbox
Write-Host "Creating the shared mailbox: $SharedMailboxName..." -ForegroundColor Yellow
New-Mailbox -Shared -Name $SharedMailboxName -Alias $Alias -PrimarySmtpAddress $PrimarySMTPAddress

# Step 4: Assign Permissions (Optional)
Write-Host "Assigning permissions for users to access the shared mailbox..." -ForegroundColor Cyan
$User1 = "user1@yourdomain.com"                            # Email address of the user
Add-MailboxPermission -Identity $PrimarySMTPAddress -User $User1 -AccessRights FullAccess -InheritanceType All
Add-RecipientPermission -Identity $PrimarySMTPAddress -Trustee $User1 -AccessRights SendAs

# Step 5: Verify Creation
Write-Host "Verifying the newly created shared mailbox..." -ForegroundColor Cyan
Get-Mailbox -Identity $PrimarySMTPAddress | Format-List Name, PrimarySmtpAddress

# Step 6: Disconnect from Exchange Online
Write-Host "Disconnecting from Exchange Online..." -ForegroundColor Green
Disconnect-ExchangeOnline -Confirm:$false

Write-Host "Script execution completed." -ForegroundColor Magenta
