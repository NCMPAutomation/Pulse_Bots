# Step 1: Define the test suite content with setup and teardown
$testSuite = @"
*** Settings ***
Suite Setup    Log    Suite setup
Suite Teardown    Log    Suite teardown

*** Test Cases ***
Test Case with Setup and Teardown
    [Documentation]    This test case has setup and teardown
    [Setup]    Log    Test case setup
    [Teardown]    Log    Test case teardown
    Log    This is the test case
"@

# Step 2: Create a new test suite file and add the setup and teardown
Write-Host "Creating test suite with setup and teardown..."
New-Item -ItemType File -Name "setup_teardown_suite.robot" -Value $testSuite
