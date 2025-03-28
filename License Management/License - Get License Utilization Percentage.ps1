# Connect to Microsoft 365
Connect-MsolService

# Calculate license utilization
$Licenses = Get-MsolAccountSku
foreach ($License in $Licenses) {
    $UtilizationPercentage = ($License.ConsumedUnits / $License.ActiveUnits) * 100
    Write-Output "$($License.AccountSkuId): $UtilizationPercentage% utilized"
}