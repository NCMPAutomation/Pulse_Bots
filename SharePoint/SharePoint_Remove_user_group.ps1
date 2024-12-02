# Load SharePoint CSOM Assemblies
# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


# Set variables
$siteUrl = ""
$username = ""
$password = ""
$groupName = ""

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

    # Remove the group
    $context.Web.SiteGroups.Remove($group)
    $context.ExecuteQuery()

    Write-Host "Group '$groupName' removed successfully."
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    if ($_.Exception.Message -like "*Group cannot be found*") {
        Write-Host "The group '$groupName' does not exist in the site."
    }
}
