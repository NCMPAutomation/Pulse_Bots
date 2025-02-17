#Installing otp module

Install-Module -Name TOTP

$secretKey = New-TOTPKey -Length 16

Import-Module ActiveDirectory
$user = "username"
$password = ConvertTo-SecureString -String $secretKey -AsPlainText -Force
Set-ADAccountPassword -Identity $user -NewPassword $password -Reset

Enable-TOTPAuthentication -User $user -SecretKey $secretKey
