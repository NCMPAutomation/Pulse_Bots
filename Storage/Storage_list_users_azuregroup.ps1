# Connect to your Azure account
Connect-AzureAD -Credential $azure_cred

# Define the group object ID or display name
$groupId = "YourGroupObjectIdOrDisplayName"

# Get all members of the group
$groupMembers = Get-AzureADGroupMember -ObjectId $groupId

# Loop through each member and display their details
foreach ($member in $groupMembers) {
    Write-Output "User Display Name: $($member.DisplayName)"
    Write-Output "User Principal Name: $($member.UserPrincipalName)"
    Write-Output "----------------------------------------"
}
