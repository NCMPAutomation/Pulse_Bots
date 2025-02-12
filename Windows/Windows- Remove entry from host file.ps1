# Define the entry to remove
$entryToRemove = "127.0.0.1    example.com"

# Path to the hosts file
$hostsFilePath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Read the hosts file
$hostsFileContent = Get-Content -Path $hostsFilePath

# Remove the specified entry
$updatedHostsFileContent = $hostsFileContent | Where-Object { $_ -notmatch [regex]::Escape($entryToRemove) }

# Write the updated content back to the hosts file
Set-Content -Path $hostsFilePath -Value $updatedHostsFileContent

# Verify the entry is removed
if ($updatedHostsFileContent -notcontains $entryToRemove) {
    Write-Output "Entry removed successfully from hosts file."
} else {
    Write-Output "Failed to remove entry from hosts file."
}