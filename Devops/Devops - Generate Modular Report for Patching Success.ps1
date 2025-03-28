# Generate a modular patching success report
Function Generate-Report {
    param ($outputPath)
    $reportData = Get-HotFix | Select-Object Description, InstalledOn
    $reportData | Export-Csv -Path $outputPath -NoTypeInformation
    Write-Host "Report generated at $outputPath."
}

Generate-Report -outputPath "C:\Temp\PatchingSuccessReport.csv"