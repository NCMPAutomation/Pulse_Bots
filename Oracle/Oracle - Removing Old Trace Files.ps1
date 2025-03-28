# Define Oracle trace file directory and retention period
$TraceDir = "C:\Oracle\Trace"
$RetentionDays = 15

# Remove trace files older than retention period
Get-ChildItem -Path $TraceDir -Filter "*.trc" | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays)
} | Remove-Item -Verbose
Write-Host "Old trace files removed from $TraceDir"