# Step 1: Define the test suite file
$testSuite = "test_suite.robot"

# Step 2: Run the Robot Framework browser automation tests
Write-Host "Running Robot Framework browser automation tests..."
robot $testSuite
