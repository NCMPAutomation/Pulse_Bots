# Define the folder path
$folderPath = "C:\ExampleFolder"
# Delete the folder
Remove-Item -Path $folderPath -Recurse -Force
# Verify the folder is deleted
if (-Not (Test-Path $folderPath)) {
    Write-Output "Folder deleted successfully from $folderPath"
} else {
    Write-Output "Failed to delete folder from $folderPath"
}