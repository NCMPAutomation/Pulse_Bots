# Define variables
$oracleHome = "C:\oracle\product\19.0.0\dbhome_1" # Path to Oracle Home
$logFile = "C:\Temp\OracleDBHealthCheck.log"      # Path to save the log file
$sqlPlus = "$oracleHome\bin\sqlplus.exe"          # Path to SQL*Plus executable
$dbUser = "system"                                # Database username
$dbPassword = "password"                          # Database password
$dbTns = "ORCL"                                   # TNS alias for the database

# Step 1: Check Database Status
Write-Output "Checking database status..." | Out-File -Append $logFile
& $sqlPlus "$dbUser/$dbPassword@$dbTns" @"
SET PAGESIZE 100
SET LINESIZE 200
COLUMN INSTANCE_NAME FORMAT A20
COLUMN STATUS FORMAT A10
SELECT INSTANCE_NAME, STATUS FROM V\$INSTANCE;
EXIT;
"@ | Out-File -Append $logFile

# Step 2: Monitor Resource Utilization
Write-Output "Checking resource utilization..." | Out-File -Append $logFile
& $sqlPlus "$dbUser/$dbPassword@$dbTns" @"
SELECT * FROM V\$RESOURCE_LIMIT;
EXIT;
"@ | Out-File -Append $logFile

# Step 3: Verify Tablespace Usage
Write-Output "Checking tablespace usage..." | Out-File -Append $logFile
& $sqlPlus "$dbUser/$dbPassword@$dbTns" @"
SELECT TABLESPACE_NAME, USED_SPACE, FREE_SPACE FROM DBA_TABLESPACE_USAGE_METRICS;
EXIT;
"@ | Out-File -Append $logFile

# Step 4: Analyze Logs for Blocking Sessions
Write-Output "Checking for blocking sessions..." | Out-File -Append $logFile
& $sqlPlus "$dbUser/$dbPassword@$dbTns" @"
SELECT BLOCKING_SESSION, SID, SERIAL#, EVENT FROM V\$SESSION WHERE BLOCKING_SESSION IS NOT NULL;
EXIT;
"@ | Out-File -Append $logFile

Write-Output "Health check completed. Review the log file at $logFile."
