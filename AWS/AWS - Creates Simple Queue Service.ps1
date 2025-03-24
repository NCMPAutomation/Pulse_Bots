# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and SQS queue parameters
$region = "us-east-1"  # Replace with your desired AWS region
$queueName = "MySQSQueue"  # Replace with your desired queue name

# Create the SQS queue
$sqsQueue = New-SQSQueue -QueueName $queueName -Region $region

# Output queue details
Write-Host "SQS queue '$queueName' created successfully."
Write-Host "Queue URL: $($sqsQueue.QueueUrl)"
