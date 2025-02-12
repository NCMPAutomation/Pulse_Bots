$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR"
# Function to enable USB ports
function Enable-USBPorts {
    Set-ItemProperty -Path $regPath -Name "Start" -Value 3
    Write-Output "USB ports have been enabled."
}
 
Enable-USBPorts
# Enable-USBPorts