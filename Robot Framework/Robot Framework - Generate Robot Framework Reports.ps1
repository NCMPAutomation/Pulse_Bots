# Step 1: Define the output directory
$outputDir = "output"

# Step 2: Run the Robot Framework tests and generate reports
Write-Host "Generating Robot Framework reports..."
robot -d $outputDir test_suite.robot
