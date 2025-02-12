# Define the directory where the temporary files are located
$tempDir = [System.IO.Path]::GetTempPath()

# Get all temporary files in the directory
$tempFiles = Get-ChildItem -Path $tempDir -Filter "*.tmp"

# Loop through each temporary file and delete it
foreach ($file in $tempFiles) {
    try {
        Remove-Item -Path $file.FullName -Force
        Write-Output "Deleted temporary file: $($file.FullName)"
    } catch {
        Write-Output "Failed to delete temporary file: $($file.FullName) - $($_.Exception.Message)"
    }
}