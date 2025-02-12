# Define the folder path
$folderPath = "C:\ExampleFolder"

# Create the folder
New-Item -Path $folderPath -ItemType Directory

# Verify the folder is created
if (Test-Path $folderPath) {
    Write-Output "Folder created successfully at $folderPath"
} else {
    Write-Output "Failed to create folder at $folderPath"
}