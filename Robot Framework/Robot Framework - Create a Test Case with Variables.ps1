# Step 1: Define the test suite content with variables
$testSuite = @"
*** Variables ***
\${URL}    https://www.example.com

*** Test Cases ***
Test Case with Variables
    [Documentation]    This test case uses variables
    Log    The URL is \${URL}
"@

# Step 2: Create a new test suite file and add the test case with variables
Write-Host "Creating test case with variables..."
New-Item -ItemType File -Name "variables_suite.robot" -Value $testSuite
