# Get the list of running processes
$processes = Get-service

# Define the path to the CSV file
$csvPath = "C:\Users\UserID\Downloads\test.csv"

# Export the process data to the CSV file
$processes | Export-Csv -Path $csvPath -NoTypeInformation

Write-Output "Process data exported to $csvPath"


# Import the CSV data
$processData = Import-Csv -Path $csvPath

# Display the imported data
$processData | Format-Table -AutoSize

Write-Output "CSV data imported successfully from $csvPath"
