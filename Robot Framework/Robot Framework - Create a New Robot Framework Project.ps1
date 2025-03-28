# Step 1: Define the project name
$projectName = "MyRobotProject"

# Step 2: Create a new directory for the project
Write-Host "Creating project directory..."
New-Item -ItemType Directory -Path $projectName

# Step 3: Navigate to the project directory
Set-Location -Path $projectName

# Step 4: Create a new test suite file
Write-Host "Creating test suite file..."
New-Item -ItemType File -Name "test_suite.robot"
