# Validate if a patch is applicable to the system
$patch = "KB123456"
$isApplicable = Get-WindowsUpdate | Where-Object { $_.Title -eq $patch }

if ($isApplicable) {
    Write-Host "Patch $patch is applicable to this system."
} else {
    Write-Host "Patch $patch is not applicable to this system."
}