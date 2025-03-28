# Define the path to scan
$Path = "C:\"

# Run a quick scan using Windows Defender
Start-MpScan -ScanType QuickScan -ScanPath $Path