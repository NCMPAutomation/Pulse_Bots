# Set AWS Region
$Region = "Location" #example us-east-1

# Define the Backup Vault name
$BackupVaultName = "MyBackupVault"    # Replace with your desired vault name

# Create the Backup Vault
$BackupVault = New-BAKBackupVault `
    -Region $Region `
    -BackupVaultName $BackupVaultName

# Output Backup Vault ARN
Write-Output "Backup Vault created with ARN: $($BackupVault.BackupVaultArn)"
