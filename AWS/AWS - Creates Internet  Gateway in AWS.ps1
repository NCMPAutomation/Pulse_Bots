# Set AWS Region
$Region = "Location" #example us-east-1

# Define a name for the Internet Gateway
$InternetGatewayName = "MyInternetGateway"

# Create the Internet Gateway
$InternetGateway = New-EC2InternetGateway -Region $Region

# Name the Internet Gateway (optional)
New-EC2Tag `
    -Region $Region `
    -Resource $InternetGateway.InternetGatewayId `
    -Tag @{"Key"="Name"; "Value"=$InternetGatewayName}

# Output Internet Gateway ID
Write-Output "Internet Gateway created with ID: $($InternetGateway.InternetGatewayId)"
