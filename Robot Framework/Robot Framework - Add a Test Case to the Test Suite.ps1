# Step 1: Define the test case content
$testCase = @"
*** Test Cases ***
Example Test Case
    [Documentation]    This is an example test case
    Log    Hello, Robot Framework!
"@

# Step 2: Add the test case to the test suite file
Write-Host "Adding test case to test suite..."
Add-Content -Path "test_suite.robot" -Value $testCase
