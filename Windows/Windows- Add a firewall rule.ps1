# Define the parameters for the new firewall rule
$ruleName = "MyNewRule"
$ruleDescription = "Allow inbound traffic on port 8080"
$localPort = 8080
$protocol = "TCP"
$direction = "Inbound"
$action = "Allow"

# Create the new firewall rule
New-NetFirewallRule -DisplayName $ruleName -Description $ruleDescription -LocalPort $localPort -Protocol $protocol -Direction $direction -Action $action