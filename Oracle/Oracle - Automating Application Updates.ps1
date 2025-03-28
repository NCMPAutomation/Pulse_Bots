# Define paths for update files
$SourcePath = "C:\Updates"
$DestinationPath = "C:\Oracle\AppUpdates"

# Copy update files to the Oracle application directory
Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse -Verbose
Write-Host "Oracle application update files copied successfully"