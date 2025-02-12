# Install msi file
# Define the download URL and the destination path
$notepadppUrl = "https://7-zip.org/a/7z2409-x64.msi"
$destination = "C:\Users\Netcon\Downloads\7z2409-x64.msi"
 
# Download the Notepad++ installer
Invoke-WebRequest -Uri $notepadppUrl -OutFile $destination
msiexec /i  $destination /qn
 
 
# Clean up the installer file
Remove-Item $destination