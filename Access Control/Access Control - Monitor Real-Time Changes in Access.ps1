# Define access file
$AccessFile = "C:\CustomApp\AccessList.txt"

# Monitor file for changes
Write-Output "Monitoring $AccessFile for changes..."
while ($true) {
    Get-Content $AccessFile
    Start-Sleep -Seconds 10
}