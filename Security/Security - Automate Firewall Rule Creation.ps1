# Define firewall rule details
$RuleName = "AllowHTTP"
$Port = 80

# Create the firewall rule
New-NetFirewallRule -DisplayName $RuleName -Direction Inbound -Protocol TCP -LocalPort $Port -Action Allow