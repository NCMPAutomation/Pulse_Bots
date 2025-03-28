# Check outdated packages and generate a report
$outdatedPackages = choco outdated | Out-String

# Save the report to a file
Set-Content -Path "C:\Temp\PackageUpdateReport.txt" -Value $outdatedPackages

Write-Host "Package update report saved to C:\Temp\PackageUpdateReport.txt."