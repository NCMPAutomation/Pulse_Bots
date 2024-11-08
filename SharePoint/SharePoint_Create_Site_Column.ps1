# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


# Set up credentials and context
$siteUrl = ""
$username = ""
$password = ""
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

# Create a new site column
$fields = $context.Web.Fields
$context.Load($fields)
$context.ExecuteQuery()

$fieldXml = "<Field Type='Text' DisplayName='MyCustomColumn_Test' Name='MyCustomColumn_test123' Group='Custom Columns' />"
$field = $fields.AddFieldAsXml($fieldXml, $true, [Microsoft.SharePoint.Client.AddFieldOptions]::DefaultValue)
$context.Load($field)
$context.ExecuteQuery()

Write-Host "Site column 'MyCustomColumn' created successfully."
