# Step 1: Define the test suite file
$testSuite = "test_suite.robot"

# Step 2: Run the Robot Framework API tests
Write-Host "Running Robot Framework API tests..."
robot $testSuite
