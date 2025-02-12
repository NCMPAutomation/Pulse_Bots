# Set a temporary environment variable for the current session
$env:MyVariable = "Temporary Value"

# Set a persistent environment variable for the current user
[System.Environment]::SetEnvironmentVariable("MyVariable", "Persistent Value", "User")

# Set a persistent environment variable for the entire system
[System.Environment]::SetEnvironmentVariable("MyVariable", "Persistent Value", "Machine")