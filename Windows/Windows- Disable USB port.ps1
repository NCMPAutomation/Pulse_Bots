Disable Ports
 
# Define the registry path for USB storage devices
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR"
 
# Function to disable USB ports
function Disable-USBPorts {
    Set-ItemProperty -Path $regPath -Name "Start" -Value 4
    Write-Output "USB ports have been disabled."
}
 
 
# Example usage
Disable-USBPorts