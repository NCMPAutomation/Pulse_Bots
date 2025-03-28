# Connect to Microsoft 365
Connect-MsolService

# Summarize license usage
$Licenses = Get-MsolAccountSku
$Licenses | Select-Object AccountSkuId, ConsumedUnits, ActiveUnits