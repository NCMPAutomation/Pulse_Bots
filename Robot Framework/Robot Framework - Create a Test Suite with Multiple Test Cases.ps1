# Step 1: Define the test suite content
$testSuite = @"
*** Test Cases ***
First Test Case
    [Documentation]    This is the first test case
    Log    This is the first test case

Second Test Case
    [Documentation]    This is the second test case
    Log    This is the second test case
"@

# Step 2: Create a new test suite file and add the test cases
Write-Host "Creating test suite with multiple test cases..."
New-Item -ItemType File -Name "multi_test_suite.robot" -Value $testSuite
