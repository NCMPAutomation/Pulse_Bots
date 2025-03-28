# Use pmcmd to check service status
Start-Process -FilePath "pmcmd" -ArgumentList "getservice -d Informatica_Domain"