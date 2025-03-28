# Check available disk space
$freeSpace = (Get-PSDrive C).Free

if ($freeSpace -ge 5GB) {
    Write-Host "Sufficient disk space for patching."
} else {
    Write-Host "Insufficient disk space for patching."
}