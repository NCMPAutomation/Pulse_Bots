# Path to listener configuration file
$ListenerConfigPath = "C:\Oracle\Network\Admin\listener.ora"

# Add a new listener entry
$NewListener = @"
LISTENER_NEW =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1522))
    )
  )
"@

# Append the new listener configuration
Add-Content -Path $ListenerConfigPath -Value $NewListener
Write-Host "New listener configuration added to $ListenerConfigPath"