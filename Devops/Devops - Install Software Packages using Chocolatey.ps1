# Install a software package using Chocolatey
$packageName = "git.install"
choco install $packageName -y

Write-Host "Package $packageName installed successfully."