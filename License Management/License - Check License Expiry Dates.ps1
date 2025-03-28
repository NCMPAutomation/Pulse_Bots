# Connect to Microsoft 365
Connect-MsolService

# Retrieve license expiration dates
$Licenses = Get-MsolAccountSku
$Licenses | Select-Object AccountSkuId, ExpirationDate