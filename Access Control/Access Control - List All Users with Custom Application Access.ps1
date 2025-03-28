# Define application access file path
$AppAccessFile = "C:\CustomApp\AccessList.txt"

# List all users with access
Get-Content $AppAccessFile | ForEach-Object { Write-Output "User: $_" }