# Connect to Microsoft 365
Connect-MsolService

# Retrieve audit logs for license assignments
Search-UnifiedAuditLog -StartDate (Get-Date).AddDays(-7) -EndDate (Get-Date) -Operations "AddLicenses", "RemoveLicenses" | 
Select-Object CreationDate, UserIds, Operation