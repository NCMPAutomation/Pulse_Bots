#This script adds a license to the azure AD user account
$user = ''
$username1 = ''
$password1 = ''
$pass1= ConvertTo-SecureString $password1 -AsPlainText -Force
$azure_cred = New-Object System.Management.Automation.PsCredential( $username1, $pass1 )
 $connect= Connect-AzureAD -Credential $azure_cred -WarningAction Ignore -Confirm:$false -Tenant "" 

# Define the user and the license
$userPrincipalName = ""
$licenseSkuId = "FLOW_FREE"  # Example for Power Automate Free license

# Get the user object
$user = Get-AzureADUser -ObjectId $userPrincipalName

# Assign the license to the user
$license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$license.SkuId = (Get-AzureADSubscribedSku | Where-Object { $_.SkuPartNumber -eq $licenseSkuId }).SkuId
$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.AddLicenses = $license

Set-AzureADUserLicense -ObjectId $user.ObjectId -AssignedLicenses $licenses

Write-Output "License added successfully to $userPrincipalName"



