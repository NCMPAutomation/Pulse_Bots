# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and alarm parameters
$region = "us-east-1"  # Replace with your desired AWS region
$alarmName = "HighCPUAlarm"  # Replace with your desired alarm name
$instanceId = "i-1234567890abcdef0"  # Replace with your EC2 instance ID
$metricName = "CPUUtilization"  # Metric to monitor
$namespace = "AWS/EC2"  # Namespace for EC2 metrics
$statistic = "Average"  # Statistic to evaluate (e.g., Average, Maximum, Minimum)
$threshold = 80  # Threshold percentage for triggering the alarm
$period = 300  # Period in seconds (e.g., 5 minutes = 300 seconds)
$evaluationPeriods = 1  # Number of evaluation periods before triggering the alarm
$comparisonOperator = "GreaterThanThreshold"  # Comparison operator for the alarm

# Create CloudWatch alarm
New-CWAlarm -AlarmName $alarmName `
            -MetricName $metricName `
            -Namespace $namespace `
            -Statistic $statistic `
            -Period $period `
            -Threshold $threshold `
            -EvaluationPeriods $evaluationPeriods `
            -ComparisonOperator $comparisonOperator `
            -Dimensions @(@{ Name = "InstanceId"; Value = $instanceId }) `
            -Region $region

Write-Host "CloudWatch Alarm '$alarmName' created successfully for EC2 Instance ID '$instanceId'."
