# List all installed packages on the system
$installedPackages = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName, DisplayVersion

Write-Host "Installed Packages:"
$installedPackages | Format-Table