# Step 1: Define the test case content
$testCase = @"
*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
API Request Test
    [Documentation]    This test case sends an API request and checks the response
    Create Session    mysession    https://jsonplaceholder.typicode.com
    ${response}=    Get Request    mysession    /posts/1
    Should Be Equal As Strings    ${response.status_code}    200
"@

# Step 2: Add the test case to the test suite file
Write-Host "Adding API test case to test suite..."
Add-Content -Path "test_suite.robot" -Value $testCase
