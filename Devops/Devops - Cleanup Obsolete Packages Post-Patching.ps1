# Remove obsolete or unused packages
$packagesToRemove = @("oldpackage1", "oldpackage2")

foreach ($pkg in $packagesToRemove) {
    choco uninstall $pkg -y
    Write-Host "Removed package: $pkg"
}