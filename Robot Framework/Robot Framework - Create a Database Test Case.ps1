# Step 1: Define the test case content
$testCase = @"
*** Settings ***
Library    DatabaseLibrary

*** Test Cases ***
Database Connection Test
    [Documentation]    This test case connects to a database and executes a query
    Connect To Database    pymysql    dbname    username    password    host    port
    Execute Sql    SELECT * FROM my_table
    Disconnect From Database
"@

# Step 2: Add the test case to the test suite file
Write-Host "Adding database test case to test suite..."
Add-Content -Path "test_suite.robot" -Value $testCase
