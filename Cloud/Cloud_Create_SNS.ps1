# Install AWS Tools for PowerShell
Install-Module -Name AWSPowerShell.NetCore

# Set up the AWS credentials
Set-AWSCredential -AccessKey YOUR_ACCESS_KEY -SecretKey YOUR_SECRET_KEY -StoreAs default

# Create a new SNS topic
$topicArn = New-SNSTopic -Name 'my-new-topic'

# Subscribe to the SNS topic
Subscribe-SNSTopic -TopicArn $topicArn -Protocol email -Endpoint 'your-email@example.com'

# Publish a message to the SNS topic
Publish-SNSMessage -TopicArn $topicArn -Message 'Hello, this is a test message!'
