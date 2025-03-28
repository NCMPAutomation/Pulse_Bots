# Connect to SAP system (reuse connection script)

# Define user details
$userDetails = @{
    "USERNAME" = "newuser"
    "PASSWORD" = "password"
    "FIRSTNAME" = "John"
    "LASTNAME" = "Doe"
}

# Create RFC function to create user
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_USER_CREATE1")
$rfcFunction.SetValue("USERNAME", $userDetails["USERNAME"])
$rfcFunction.SetValue("PASSWORD", $userDetails["PASSWORD"])
$rfcFunction.SetValue("FIRSTNAME", $userDetails["FIRSTNAME"])
$rfcFunction.SetValue("LASTNAME", $userDetails["LASTNAME"])

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "User created successfully"
