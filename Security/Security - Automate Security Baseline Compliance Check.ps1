# Import the Security Compliance Toolkit module
Import-Module SecurityComplianceToolkit

# Define the baseline path
$BaselinePath = "C:\SecurityBaseline"

# Check compliance against the baseline
Invoke-SCTCheck -BaselinePath $BaselinePath