# SQL query to fetch performance metrics
$Query = @"
SELECT * 
FROM V$SYSSTAT 
WHERE STATISTIC# < 100;
"@

# Execute the query using SQL*Plus
sqlplus YourUsername/YourPassword@YourServiceName <<EOF
SPOOL PerformanceMetrics.txt;
$Query
SPOOL OFF;
EXIT;
EOF

Write-Host "Performance metrics saved to PerformanceMetrics.txt"