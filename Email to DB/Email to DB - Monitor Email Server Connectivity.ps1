# Check if the email server is online
if ($Namespace.ExchangeConnectionMode -ne 0) {
    Write-Output "Email server is online"
} else {
    Write-Error "Email server is offline"
}