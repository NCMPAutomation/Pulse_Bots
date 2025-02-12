# Define the command to execute in cmd.exe
$command = "dir C:\ExampleFolder"

# Execute the command in cmd.exe
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $command" -Wait

# Alternatively, you can use Invoke-Expression for simpler commands
# Invoke-Expression -Command "cmd.exe /c $command"