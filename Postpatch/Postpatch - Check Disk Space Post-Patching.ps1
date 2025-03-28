# Check disk space post-patching to ensure patches didn't consume excessive space
$diskSpace = Get-PSDrive C

Write-Host "Disk Space on C: Drive - Used: $($diskSpace.Used), Free: $($diskSpace.Free)"