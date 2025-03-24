# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and SQS queue URL
$region = "us-east-1"  # Replace with your desired AWS region
$queueUrl = "https://sqs.us-east-1.amazonaws.com/123456789012/MySQSQueue"  # Replace with your SQS queue URL

# Delete the SQS queue
Remove-SQSQueue -QueueUrl $queueUrl -Region $region

Write-Host "SQS queue with URL '$queueUrl' has been deleted successfully in region '$region'."
