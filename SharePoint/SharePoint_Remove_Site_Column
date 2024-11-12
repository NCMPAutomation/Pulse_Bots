# Load SharePoint CSOM Assemblies
# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


# Set variables
$siteUrl = ""
$username = ""
$password = ""
$columnName = ""  # Name of the site column to be removed

# Create a secure password
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Create a SharePoint Online credentials object
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)

# Connect to the SharePoint site
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

try {
    # Get the site column
    $field = $context.Web.Fields.GetByInternalNameOrTitle($columnName)
    $field.DeleteObject()
    $context.ExecuteQuery()

    Write-Host "Site column '$columnName' removed successfully."
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    if ($_.Exception.Message -like "*Field cannot be found*") {
        Write-Host "The site column '$columnName' does not exist in the site."
    }
}
