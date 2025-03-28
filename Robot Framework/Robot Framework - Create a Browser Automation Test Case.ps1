# Step 1: Define the test case content
$testCase = @"
*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser Test
    [Documentation]    This test case opens a browser and navigates to a website
    Open Browser    https://www.example.com    chrome
    Close Browser
"@

# Step 2: Add the test case to the test suite file
Write-Host "Adding browser automation test case to test suite..."
Add-Content -Path "test_suite.robot" -Value $testCase
