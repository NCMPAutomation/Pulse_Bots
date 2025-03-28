# Check if a system restart is pending
$pendingRestart = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -ErrorAction SilentlyContinue

if ($pendingRestart) {
    Write-Host "System requires a restart before patching."
} else {
    Write-Host "No pending restarts detected."
}