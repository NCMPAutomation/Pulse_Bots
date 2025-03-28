# Step 1: Update the package list
Write-Host "Updating package list..."
Update-Package -Name *

# Step 2: Install Robot Framework using pip
Write-Host "Installing Robot Framework..."
pip install robotframework
