# Define a modular workflow for installing and verifying a package
Function Install-Package {
    param ($pkg)
    choco install $pkg -y
    Write-Host "Package $pkg installed."
}

Function Verify-Package {
    param ($pkg)
    $installed = choco list --local-only | Select-String $pkg
    if ($installed) {
        Write-Host "Package $pkg is installed."
    } else {
        Write-Host "Package $pkg installation failed."
    }
}

# Use the workflow
$packageName = "7zip"
Install-Package $packageName
Verify-Package $packageName