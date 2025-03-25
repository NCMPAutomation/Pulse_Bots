# Define variables
$bitnamiOvaUrl = "https://bitnami.com/path-to-hadoop-ova-file" # Replace with actual Bitnami OVA URL
$localOvaPath = "C:\Temp\bitnami-hadoop.ova"                  # Local path to save the OVA file
$vmName = "Bitnami_Hadoop_VM"                                 # Virtual machine name
$vmxDirectory = "C:\VMs\Bitnami_Hadoop"                       # Directory to store VMX files
$vmwareExecutable = "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" # Path to vmrun.exe

# Step 1: Download the Hadoop OVA file
Write-Output "Downloading the Bitnami Hadoop OVA file..."
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

# Step 5: Provide Hadoop access information
Write-Output "Access Hadoop HDFS at: http://$vmIp:9870"
Write-Output "Access Hadoop YARN at: http://$vmIp:8088"
Write-Output "Log in using the default Bitnami credentials displayed in the VM console."
