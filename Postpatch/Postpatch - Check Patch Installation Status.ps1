# Check the installation status of specific patches applied
$patches = @("KB123456", "KB789012")
foreach ($patch in $patches) {
    $status = Get-HotFix | Where-Object { $_.Description -eq $patch }
    Write-Host "Patch $patch Status: $($status.InstalledOn)"
}
