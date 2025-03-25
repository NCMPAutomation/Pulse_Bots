# Define variables
$psqlPath = "C:\Program Files\PostgreSQL\15\bin\psql.exe" # Path to psql executable
$dbUser = "postgres"                                      # Database username
$dbPassword = "password"                                  # Database password
$dbName = "postgres"                                      # Database name
$logFile = "C:\Temp\PostgreSQLHealthCheck.log"            # Path to save the log file

# Step 1: Check Database Status
Write-Output "Checking database status..." | Out-File -Append $logFile
& $psqlPath -U $dbUser -d $dbName -c "SELECT datname, numbackends, xact_commit, xact_rollback, blks_read, blks_hit FROM pg_stat_database;" | Out-File -Append $logFile

# Step 2: Monitor Active Connections
Write-Output "Checking active connections..." | Out-File -Append $logFile
& $psqlPath -U $dbUser -d $dbName -c "SELECT * FROM pg_stat_activity;" | Out-File -Append $logFile

# Step 3: Verify Tablespace Usage
Write-Output "Checking tablespace usage..." | Out-File -Append $logFile
& $psqlPath -U $dbUser -d $dbName -c "SELECT spcname, pg_size_pretty(pg_tablespace_size(spcname)) AS size FROM pg_tablespace;" | Out-File -Append $logFile

# Step 4: Analyze Blocking Sessions
Write-Output "Checking for blocking sessions..." | Out-File -Append $logFile
& $psqlPath -U $dbUser -d $dbName -c "SELECT blocked_locks.pid AS blocked_pid, blocking_locks.pid AS blocking_pid, blocked_activity.query AS blocked_query, blocking_activity.query AS blocking_query FROM pg_locks blocked_locks JOIN pg_stat_activity blocked_activity ON blocked_activity.pid = blocked_locks.pid JOIN pg_locks blocking_locks ON blocking_locks.locktype = blocked_locks.locktype AND blocking_locks.database IS NOT DISTINCT FROM blocked_locks.database AND blocking_locks.relation IS NOT DISTINCT FROM blocked_locks.relation AND blocking_locks.page IS NOT DISTINCT FROM blocked_locks.page AND blocking_locks.tuple IS NOT DISTINCT FROM blocked_locks.tuple AND blocking_locks.virtualxid IS NOT DISTINCT FROM blocked_locks.virtualxid AND blocking_locks.transactionid IS NOT DISTINCT FROM blocked_locks.transactionid AND blocking_locks.classid IS NOT DISTINCT FROM blocked_locks.classid AND blocking_locks.objid IS NOT DISTINCT FROM blocked_locks.objid AND blocking_locks.objsubid IS NOT DISTINCT FROM blocked_locks.objsubid AND blocking_locks.pid != blocked_locks.pid JOIN pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid;" | Out-File -Append $logFile

Write-Output "Health check completed. Review the log file at $logFile."
