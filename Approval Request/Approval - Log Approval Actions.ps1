# Log approval or rejection actions
$logEntry = @{
    RequestID   = "Req001"
    Approver    = "approver1@domain.com"
    Action      = "Approved"
    ActionTime  = (Get-Date)
}

# Append to the log file
$logEntry | ConvertTo-Json | Add-Content -Path "C:\Temp\ApprovalLog.json"

Write-Host "Approval action logged."