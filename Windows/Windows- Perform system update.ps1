# Set the execution policy to allow script execution
Set-ExecutionPolicy RemoteSigned -Force
 
# Install the PSWindowsUpdate module
Install-Module -Name PSWindowsUpdate -Force
 
# Import the module
Import-Module PSWindowsUpdate
 
# Check for available updates
Get-WindowsUpdate
 
# Install all available updates
Install-WindowsUpdate -AcceptAll -AutoReboot