# Define variables
$bitnamiOvaUrl = "https://bitnami.com/path-to-lamp-ova-file"  # Replace with the actual Bitnami OVA file URL
$localOvaPath = "C:\Temp\bitnami-lamp.ova"                   # Local path to save the OVA file
$vmName = "Bitnami_LAMP_VM"                                  # Name of the virtual machine
$vmxDirectory = "C:\VMs\Bitnami_LAMP"                        # Directory to store VMX files
$vmwareExecutable = "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" # Path to vmrun.exe

# Step 1: Download the Bitnami OVA file
Write-Output "Downloading the Bitnami LAMP OVA file..."
Invoke-WebRequest -Uri $bitnamiOvaUrl -OutFile $localOvaPath

if (!(Test-Path $localOvaPath)) {
    Write-Error "Failed to download the OVA file. Exiting."
    exit
}
Write-Output "Successfully downloaded the OVA file to $localOvaPath."

# Step 2: Import the OVA file into VMware Workstation
Write-Output "Importing the OVA file into VMware Workstation..."
Start-Process -FilePath $vmwareExecutable -ArgumentList "import", "`"$localOvaPath`"", "`"$vmxDirectory`"" -Wait

if (!(Test-Path $vmxDirectory)) {
    Write-Error "Failed to import the OVA file. Exiting."
    exit
}
Write-Output "Successfully imported the VM. VM files are located in $vmxDirectory."

# Step 3: Power on the virtual machine
Write-Output "Powering on the virtual machine..."
Start-Process -FilePath $vmwareExecutable -ArgumentList "start", "`"$vmxDirectory\$vmName.vmx`"", "nogui" -Wait

Write-Output "The virtual machine has been powered on."

# Step 4: Display the VM IP address (optional)
Write-Output "Fetching the IP address of the virtual machine..."
Start-Sleep -Seconds 10  # Wait for the VM to fully boot up
$vmIp = Start-Process -FilePath $vmwareExecutable -ArgumentList "getGuestIPAddress", "`"$vmxDirectory\$vmName.vmx`"" -NoNewWindow -PassThru | Out-String
Write-Output "The IP address of the VM is: $vmIp"

# Step 5: Provide information on how to access the LAMP application
Write-Output "You can now access the LAMP stack web server at http://$vmIp."
Write-Output "Log in to the VM using the default Bitnami credentials displayed in the VMware console."
