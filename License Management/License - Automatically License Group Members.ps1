# Connect to Microsoft 365
Connect-MsolService

# Define group and license
$Group = "Sales Team"
$LicenseSku = "contoso:ENTERPRISEPACK"

# Assign licenses to group members
$GroupMembers = Get-MsolGroupMember -SearchString $Group
foreach ($Member in $GroupMembers) {
    Set-MsolUserLicense -UserPrincipalName $Member.EmailAddress -AddLicenses $LicenseSku
}