# Load SharePoint CSOM Assemblies
# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


# Set variables
$siteUrl = ""
$username = ""
$password = ""
$groupName = ""
$userToRemove = "i:0#.f|membership|user email ID"  # The email or login name of the user to remove

# Create a secure password
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Create a SharePoint Online credentials object
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)

# Connect to the SharePoint site
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

try {
    # Get the group
    $group = $context.Web.SiteGroups.GetByName($groupName)
    $context.Load($group)
    $context.ExecuteQuery()

    # Load the users in the group
    $context.Load($group.Users)
    $context.ExecuteQuery()

    # List all users in the group
    Write-Host "Users in group '$groupName':"
    foreach ($user in $group.Users) {
        Write-Host $user.LoginName
    }

    # Remove the specified user from the group
    $userToRemoveObj = $group.Users | Where-Object { $_.Email -eq $userToRemove -or $_.LoginName -eq $userToRemove }
    if ($userToRemoveObj -ne $null) {
        $group.Users.Remove($userToRemoveObj)
        $context.ExecuteQuery()
        Write-Host "User '$userToRemove' removed from group '$groupName' successfully."
    } else {
        Write-Host "User '$userToRemove' not found in group '$groupName'."
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    if ($_.Exception.Message -like "*Group cannot be found*") {
        Write-Host "The group '$groupName' does not exist in the site."
    }
}
