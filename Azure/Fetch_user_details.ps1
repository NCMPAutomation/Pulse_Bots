param([parameter(mandatory=$true)][string]$user,[parameter(mandatory=$true)][string]$user_mobile,[parameter(mandatory=$true)][string]$employeeid)
#Import-Module AZureAD
$username1='netdevopsid@netcon.in'
$password1 = 'D3v0ps@321'
$pass1=$password1 |ConvertTo-SecureString -AsPlainText -Force
$Creds = New-Object  System.Management.Automation.PsCredential($username1,$pass1)
$connect=Connect-AzureAD -Credential $Creds
$user_found=Get-AzureADUser -ObjectID $user | Select *
$activity=$user_found.AccountEnabled
$dep = Get-AzureADUser -ObjectID $user | Select Department
$mobile=Get-AzureADUser -ObjectID $user | Select mobile
$user_found1=Get-AzureADUser -ObjectId $user | Select *
$employeeid1=($user_found1.ExtensionProperty).employeeId
$name=(Get-AzureADUser -ObjectID $user | Select GivenName).Givenname
$department = ($dep).department
$name
$department
$email_id=$user_found.UserPrincipalName
 
if(($employeeid -eq $employeeid1))
{
 $a = $true
}
else
{
$a = $false
}

 
if($activity -eq "True"){
 
if(($mobile.Mobile -match $user_mobile) -and ($a -eq $true)){
echo "True"
}
else
{
echo "Username details are incorrect"
}
 
}
else
{
echo "User $user is not available in the Azure AD"
}

$otp=( (0..5) | ForEach-Object { Get-Random -Minimum 0 -Maximum 9 } ) -join ''

$smtpServer = "smtp.office365.com"
$smtpPort = 587
$from = "netconncmp@netcon.in"
$to = $email_id
$bcc = "soumya.a@netcon.in"
$subject = "NCMP portal authentication"
$body = "Hi,

Please find the below OTP for NCMP portal authentication.
$otp         

Best regards,
Automation Team"
$username = "netconncmp@netcon.in"
$password = "DRd00m_2024" # Consider using a secure string for passwords
# Create a secure password
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
# Create a new PSCredential object
$credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)
# Send the email
Send-MailMessage -From $from -To $to -Bcc $bcc -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -UseSsl -Credential $credential
