
# Define the user to be deleted
$userName = "UserName"

# Check if the user exists
$user = Get-ADUser -Filter { SamAccountName -eq $userName }

if ($user) {
    # If the user exists, delete the user
    Remove-ADUser -Identity $userName -Confirm:$false
    Write-Output "User $userName has been deleted from Active Directory."
} else {
    Write-Output "User $userName does not exist in Active Directory."
}


<#In this script:
- Replace `"UserName"` with the SAMAccountName of the user you want to delete.#>
