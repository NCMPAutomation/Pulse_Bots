#Install python packages using PIP
# Ensure Python is installed and available in the PATH
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python is not installed or not in the PATH. Please install Python first."
    exit 1
}
# Install pip if it's not already installed
if (-not (Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Host "pip is not installed. Installing pip..."
    Invoke-WebRequest -Uri https://bootstrap.pypa.io/get-pip.py -OutFile "$env:TEMP\get-pip.py"
    python "$env:TEMP\get-pip.py"
}
# Install Jupyter Notebook
$packageName = "notebook"
Write-Host "Installing $packageName..."
pip install $packageName
# Verify installation
# Define the package name
 
# Check if the package is installed
$packageInstalled = & python -m pip show $packageName
 
if ($packageInstalled) {
    Write-Output "Package '$packageName' is installed."
} else {
    Write-Output "Package '$packageName' is not installed."
}