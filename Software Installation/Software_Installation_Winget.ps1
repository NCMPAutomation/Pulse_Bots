# Download the WinGet installer script
Invoke-WebRequest -Uri "https://github.com/asheroto/winget-install/raw/master/winget-install.ps1" -OutFile "C:\Users\abcd\Documents\winget.ps1"
 
# Set the execution policy to allow the script to run
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
 
# Run the installer script
& "C:\Users\userid\Documents\winget.ps1" -Force
 
winget install --id Notepad++.Notepad++ -e --accept-source-agreements --accept-package-agreements



#To be run as non admin