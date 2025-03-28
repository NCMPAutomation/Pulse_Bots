# Send email alerts based on report insights
$Insights = Import-Csv "C:\Data\InsightsReport.csv"
$Outlook = New-Object -ComObject Outlook.Application
foreach ($Insight in $Insights) {
    if ($Insight.AlertType -eq "High Risk") {
        $Email = $Outlook.CreateItem(0)
        $Email.To = "admin@example.com"
        $Email.Subject = "Alert: High-Risk Insight Detected"
        $Email.Body = "Details: $Insight"
        $Email.Send()
    }
}