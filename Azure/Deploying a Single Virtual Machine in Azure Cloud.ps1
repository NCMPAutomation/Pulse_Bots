# Connect to your Azure account
Connect-AzAccount

# Variables
$resourceGroupName = "myResourceGroup"
$location = "EastUS"
$vmName = "myWindowsVM"
$vmSize = "Standard_DS1_v2"
$adminUsername = "azureuser"
$adminPassword = ConvertTo-SecureString "P@ssw0rd1234" -AsPlainText -Force

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a virtual network
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Location $location -Name "myVnet" -AddressPrefix "10.0.0.0/16"
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name "mySubnet" -AddressPrefix "10.0.0.0/24" -VirtualNetwork $vnet
$vnet | Set-AzVirtualNetwork

# Create a public IP address
$pip = New-AzPublicIpAddress -ResourceGroupName $resourceGroupName -Location $location -Name "myPublicIP" -AllocationMethod Dynamic

# Create a network security group
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Location $location -Name "myNSG"

# Create a NIC
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroupName -Location $location -Name "myNIC" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

# Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize | `
    Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential (New-Object System.Management.Automation.PSCredential($adminUsername, $adminPassword)) | `
    Set-AzVMSourceImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest" | `
    Add-AzVMNetworkInterface -Id $nic.Id

# Create the virtual machine
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vmConfig