# Generate a dashboard showing approval status for all requests
$approvalData = Get-Content -Path "C:\Temp\ApprovalLog.json" | ConvertFrom-Json

# Display dashboard
$approvalData | Format-Table RequestID, Approver, Action, ActionTime