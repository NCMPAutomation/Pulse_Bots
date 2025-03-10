Import-Module -Name Microsoft.Online.SharePoint.PowerShell #-UseWindowsPowerShell

# Connect to SharePoint Online
Connect-SPOService -Url https://netcontech-admin.sharepoint.com 
Get-SPOSite -Identity https://netcontechn-admin.sharepoint.com
$allsites = Get-SPOSite -Limit ALL

# Filter sites with URLs containing "test_pulse"
$sites = $allsites | Where-Object { $_.Url -like "*test_pulse*" } | Select-Object -ExpandProperty Url

# Initialize a variable to store all file paths
$allFilePaths = @()

foreach($site in $sites) {
    $username = ''
    $password = ''
    $pass = ConvertTo-SecureString $password -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PsCredential($username, $pass)
    
    # Connect to the SharePoint site
    $siteUrl = $site
    try {
        Connect-PnPOnline -Url $siteUrl -Credentials $credential
        Write-Host "Successfully connected to SharePoint site: $siteUrl"
    } catch {
        Write-Host "Failed to connect to SharePoint site. Please check the URL and your credentials."
        exit
    }
    
    # Set the date range for recently modified files
    $dateFrom = (Get-Date).AddHours(-12)  # Example: last 12 hours
    Write-Host "Fetching files modified since $dateFrom"
    
    # Get all items modified within the date range
    try {
        $files = Get-PnPListItem -List "Documents" -Query "<View><Query><Where><Geq><FieldRef Name='Modified'/><Value Type='DateTime'>$($dateFrom.ToString('yyyy-MM-ddTHH:mm:ssZ'))</Value></Geq></Where></Query></View>"
        Write-Host "Found $($files.Count) files modified since $dateFrom."
    } catch {
        Write-Host "Failed to retrieve items from the document library."
        exit
    }
    
    # Store the file paths in the variable
    foreach ($file in $files) {
        try {
            $allFilePaths += $file.FieldValues["FileRef"]
        } catch {
            Write-Host "Failed to output file path for item with ID: $($file.Id)"
        }
    }
}

# Display all file paths
$allFilePaths
Write-Host "Files modified since $dateFrom have been listed."