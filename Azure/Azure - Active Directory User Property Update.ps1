

param([parameter(mandatory=$true)][string]$user,[parameter(mandatory=$true)][string]$user_mobile,[parameter(mandatory=$true)][string]$employeeid)
try{
Enter-PSSession -ComputerName localhost
$username1='netdevopsid@netcon.in'
$password1 = ''
$pass1=$password1 |ConvertTo-SecureString -AsPlainText -Force
$Creds = New-Object  System.Management.Automation.PsCredential($username1,$pass1)
$connect=Connect-AzureAD -Credential $Creds
$user_found=Get-AzureADUser -ObjectID $user | Select DisplayName,UserPrincipalName,AccountEnabled
$activity=$user_found.AccountEnabled
$dep = Get-AzureADUser -ObjectID $user | Select Department
$mobile=Get-AzureADUser -ObjectID $user | Select mobile
$user_found1=Get-AzureADUser -ObjectId $user | Select *
$employeeid1=($user_found1.ExtensionProperty).employeeId
$name=(Get-AzureADUser -ObjectID $user | Select GivenName).Givenname
$department = ($dep).department
$name
$department
if($activity -eq "True"){
if(($mobile -match $user_mobile)){
if(($employeeid -eq $employeeid1))
{
 $a = $true
 Write-Output $a
}
else
{
Write-Output "The employee ID you have entered is incorrect. Please enter the correct employee ID."
}
}
else{
Write-Output "The mobile number you have entered is incorrect. Please enter the correct mobile number."
}
}
else{
Write-Output "The email ID you have entered is incorrect. Please enter the correct email ID."
}
Disconnect-AzAccount
Exit-PSSession
}
catch{
$_.Exception.Message
}
