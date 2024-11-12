# Load SharePoint CSOM Assemblies
# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


# Set variables
$siteUrl = ""
$username = ""
$password = ""
$listName = ""  # Name of the list to be removed

# Create a secure password
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Create a SharePoint Online credentials object
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)

# Connect to the SharePoint site
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

try {
    # Get the list
    $list = $context.Web.Lists.GetByTitle($listName)
    $context.Load($list)
    $context.ExecuteQuery()

    # Remove the list
    $list.DeleteObject()
    $context.ExecuteQuery()

    Write-Host "List '$listName' removed successfully."
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    if ($_.Exception.Message -like "*List cannot be found*") {
        Write-Host "The list '$listName' does not exist in the site."
    }
}
