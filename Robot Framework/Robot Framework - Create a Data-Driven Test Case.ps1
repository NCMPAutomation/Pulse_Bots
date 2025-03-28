# Step 1: Define the test suite content with data-driven test case
$testSuite = @"
*** Test Cases ***
Data-Driven Test Case
    [Documentation]    This test case is data-driven
    [Template]    Log
    Input 1
    Input 2
    Input 3
"@

# Step 2: Create a new test suite file and add the data-driven test case
Write-Host "Creating data-driven test case..."
New-Item -ItemType File -Name "data_driven_suite.robot" -Value $testSuite
