# Deploy a package to multiple servers
$servers = @("Server1", "Server2", "Server3")
$packageName = "git.install"

foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -ScriptBlock {
        param($pkg)
        choco install $pkg -y
    } -ArgumentList $packageName

    Write-Host "Package $packageName deployed on $server."
}