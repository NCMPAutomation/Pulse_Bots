# Define patch file path
$PatchFile = "C:\OraclePatches\Patch123.zip"
$InstallationDir = "C:\Oracle\Install"

# Unzip and apply the patch
Expand-Archive -Path $PatchFile -DestinationPath $InstallationDir
Write-Host "Patch extracted and ready for installation at $InstallationDir"