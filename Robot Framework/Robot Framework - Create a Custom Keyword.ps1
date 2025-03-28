# Step 1: Define the custom keyword content
$keyword = @"
*** Keywords ***
Custom Log
    [Arguments]    ${message}
    Log    ${message}
"@

# Step 2: Add the custom keyword to the test suite file
Write-Host "Adding custom keyword to test suite..."
Add-Content -Path "test_suite.robot" -Value $keyword
