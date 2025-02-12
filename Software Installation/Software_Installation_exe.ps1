#Installation of exe file
# Define the download URL and the destination path
$notepadppUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.6/npp.8.5.6.Installer.x64.exe"
$destination = "C:\Users\Netcon\Downloads\notepadpp_installer.exe"
 
# Download the Notepad++ installer
Invoke-WebRequest -Uri $notepadppUrl -OutFile $destination
 
Start-Process -FilePath $destination -ArgumentList "/S" -Wait
 
# Clean up the installer file
Remove-Item $destination