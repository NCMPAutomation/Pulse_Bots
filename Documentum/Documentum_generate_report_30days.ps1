# Load Documentum libraries
Add-Type -Path "C:\Path\To\Documentum\dfc.jar"
Add-Type -Path "C:\Path\To\Documentum\dfcbase.jar"

# Initialize Documentum session
$sessionManager = New-Object Documentum.DfClient.DfClientX
$session = $sessionManager.getLocalClient().newSession("repository_name", "username", "password")

# Define the DQL query
$dqlQuery = "SELECT object_name, r_object_id, r_creation_date FROM dm_document WHERE r_creation_date > DATE(NOW) - 30"

# Execute the DQL query
$query = $session.newQuery($dqlQuery)
$collection = $query.execute($session, $null)

# Prepare the CSV file
$outputFile = "C:\Path\To\Output\report.csv"
$csvContent = @()

# Process the query results
while ($collection.next()) {
    $row = @{
        "Object Name" = $collection.getString("object_name")
        "Object ID" = $collection.getString("r_object_id")
        "Creation Date" = $collection.getString("r_creation_date")
    }
    $csvContent += New-Object PSObject -Property $row
}

# Export the results to a CSV file
$csvContent | Export-Csv -Path $outputFile -NoTypeInformation

# Release session
$session.disconnect()

Write-Output "Report generated successfully at $outputFile"

#Make sure to replace "C:\Path\To\Documentum\dfc.jar" and "C:\Path\To\Documentum\dfcbase.jar" with the actual paths to your Documentum libraries, and update the repository name, username, password, and output file path accordingly.

