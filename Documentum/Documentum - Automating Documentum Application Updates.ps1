# Define paths for update files
$SourcePath = "C:\Updates"
$DestinationPath = "C:\Documentum\AppUpdates"

# Copy update files to the Documentum application directory
Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse -Verbose
Write-Host "Documentum application update files copied successfully"