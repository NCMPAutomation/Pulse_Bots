# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the Backup Plan
$BackupPlanName = "MyBackupPlan"
$RuleName = "DailyBackupRule"
$TargetBackupVaultName = "Default" # Replace with your backup vault name

# Define the Backup Rule
$BackupRule = @{
    RuleName = $RuleName
    TargetBackupVaultName = $TargetBackupVaultName
    ScheduleExpression = "cron(0 12 * * ? *)" # Daily backup at 12:00 UTC
    StartWindowMinutes = 60
    CompletionWindowMinutes = 180
    Lifecycle = @{
        DeleteAfterDays = 30  # Retain backups for 30 days
    }
}

# Create the Backup Plan
$BackupPlan = @{
    BackupPlanName = $BackupPlanName
    Rules = @($BackupRule)
}

# Call AWS to create the Backup Plan
$CreatedBackupPlan = New-BAKBackupPlan `
    -Region $Region `
    -BackupPlan $BackupPlan

# Output Backup Plan ID
Write-Output "Backup Plan created with ID: $($CreatedBackupPlan.BackupPlanId)"
