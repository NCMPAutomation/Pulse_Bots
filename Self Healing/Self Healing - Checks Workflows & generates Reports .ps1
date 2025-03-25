# Parameters
param (
    [string]$resourceGroupName,
    [string]$reportPath = "C:\AzureWorkflowReport.csv"
)

# Connect to Azure
Connect-AzAccount

# Initialize CSV report
$report = @()
$header = "ResourceGroup,LogicAppName,WorkflowName,Status,RunStartTime,RunEndTime"
$report += $header

# Get all Logic Apps in the specified resource group
$logicApps = Get-AzLogicApp -ResourceGroupName $resourceGroupName

foreach ($logicApp in $logicApps) {
    # Get all workflow runs for each Logic App
    $workflowRuns = Get-AzLogicAppRunHistory -ResourceGroupName $resourceGroupName -Name $logicApp.Name

    foreach ($run in $workflowRuns) {
        $status = $run.Status
        $startTime = $run.StartTime
        $endTime = $run.EndTime
        $report += "$($resourceGroupName),$($logicApp.Name),$($run.Name),$status,$startTime,$endTime"
    }
}

# Save report to CSV
$report | Out-File -FilePath $reportPath -Encoding UTF8

Write-Host "Workflow report generated at $reportPath"