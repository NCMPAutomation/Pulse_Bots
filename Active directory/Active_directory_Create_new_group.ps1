# Define the group properties
$groupName = "NewGroupName"
$groupCategory = "Security" # or "Distribution"
$groupScope = "Global" # or "DomainLocal" or "Universal"
$description = "Description of the new group"
$path = "OU=Groups,DC=example,DC=com" # Specify the Organizational Unit (OU) path

# Create the new group
New-ADGroup -Name $groupName -GroupCategory $groupCategory -GroupScope $groupScope -Description $description -Path $path
<#In this script:

Replace "NewGroupName" with the name of the new group.
Choose between "Security" or "Distribution" for the group category.
Choose between "Global", "DomainLocal", or "Universal" for the group scope.
Replace "Description of the new group" with a description for the group.
Replace "OU=Groups,DC=example,DC=com" with the appropriate OU path in your Active Directory12.#>
