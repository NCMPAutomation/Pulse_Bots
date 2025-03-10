Script to fetch files modified in last 12 hours in local system
 
# Specify the directory to scan
$path = "Path which folder needs to be checked"
 
# Calculate the time 12 hours ago
$timeThreshold = (Get-Date).AddHours(-12)
 
# Define the file extensions to filter (Word, Excel, PowerPoint, and Text files)
$fileExtensions = @(".docx", ".xlsx", ".pptx", ".txt", ".ps1", ".csv")
 
# Retrieve and display files with the specified extensions modified in the last 12 hours
Get-ChildItem -Path $path -Recurse | Where-Object {
    $_.LastWriteTime -gt $timeThreshold -and $fileExtensions -contains $_.Extension
} | ForEach-Object {
    Write-Output "File Name: $($_.FullName) | Last Modified: $($_.LastWriteTime)"
}