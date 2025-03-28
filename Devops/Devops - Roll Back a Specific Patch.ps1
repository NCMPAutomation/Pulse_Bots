# Uninstall a specific patch
$patch = "KB123456"

Write-Host "Uninstalling patch $patch..."
wusa /uninstall /kb:$patch /quiet /norestart

Write-Host "Patch $patch uninstalled successfully."