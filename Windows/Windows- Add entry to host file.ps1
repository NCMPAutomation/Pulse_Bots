# Define the new entry
$newEntry = "127.0.0.1    example.com"

# Path to the hosts file
$hostsFilePath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Add the new entry to the hosts file
Add-Content -Path $hostsFilePath -Value $newEntry

# Verify the entry is added
Get-Content -Path $hostsFilePath | Select-String -Pattern "example.com"