# Email a summary of insights
$Summary = @"
Total Rows: $($Data.Count)
Total Value: $($Data | Measure-Object -Property ValueColumn -Sum).Sum
"@
$Email = $Outlook.CreateItem(0)
$Email.To = "manager@example.com"
$Email.Subject = "Summary Report"
$Email.Body = $Summary
$Email.Send()
Write-Output "Summary report emailed."