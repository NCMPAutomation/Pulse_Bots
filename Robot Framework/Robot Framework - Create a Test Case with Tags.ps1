# Step 1: Define the test suite content with tags
$testSuite = @"
*** Test Cases ***
Test Case with Tags
    [Documentation]    This test case has tags
    [Tags]    smoke    regression
    Log    This is a test case with tags
"@

# Step 2: Create a new test suite file and add the test case with tags
Write-Host "Creating test case with tags..."
New-Item -ItemType File -Name "tags_suite.robot" -Value $testSuite
