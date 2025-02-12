#Patch date and Patch details report
$remoteHost = "4.240.50.82"
# Get the current list of trusted hosts
$trusted_hosts = (Get-Item WSMan:\localhost\Client\TrustedHosts).Value
if($trusted_hosts -notmatch $remoteHost){
 
 
# Replace 'RemoteServerName' with the name or IP address of the remote server
 
 
# Add the remote host to the trusted hosts list
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $remoteHost -Concatenate
Write-Output "Trusted host added"
}
# Define the remote server and credentials
$remoteServer = $remoteHost
$credential = Get-Credential
# Create a script block to run on the remote server
$scriptBlock = {
 
# Get the list of installed updates
$updates = Get-HotFix
 
# Create a custom object for each update
$report = $updates | ForEach-Object {
    [PSCustomObject]@{
        ComputerName = $_.PSComputerName
        Description  = $_.Description
        HotFixID     = $_.HotFixID
        InstalledBy  = $_.InstalledBy
        InstalledOn  = $_.InstalledOn
    }
}
 
return $report 
}
# Execute the script block on the remote server
$Report = Invoke-Command -ComputerName $remoteServer -Credential $credential -ScriptBlock $scriptBlock
# Display the results
$Report | Format-Table -AutoSize
