# Define user and application details
$UserName = "jdoe"
$AppAccessFile = "C:\CustomApp\AccessList.txt"

# Grant access by adding the user to the access file
Add-Content -Path $AppAccessFile -Value $UserName
Write-Output "$UserName has been granted access to the custom application."