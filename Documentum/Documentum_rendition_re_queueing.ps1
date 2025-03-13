# Load Documentum libraries
Add-Type -Path "C:\Path\To\Documentum\dfc.jar"
Add-Type -Path "C:\Path\To\Documentum\dfcbase.jar"

# Initialize Documentum session
$sessionManager = New-Object Documentum.DfClient.DfClientX
$session = $sessionManager.getLocalClient().newSession("repository_name", "username", "password")

# Define the DQL query to identify failed renditions
$dqlQuery = "SELECT r_object_id, item_id, item_name, date_sent FROM dmi_queue_item WHERE name = 'dm_autorender_win31' AND task_state = 'failed'"

# Execute the DQL query
$query = $session.newQuery($dqlQuery)
$collection = $query.execute($session, $null)

# Prepare to re-queue failed items
$failedItems = @()

# Process the query results
while ($collection.next()) {
    $item = @{
        "Object ID" = $collection.getString("r_object_id")
        "Item ID" = $collection.getString("item_id")
        "Item Name" = $collection.getString("item_name")
        "Date Sent" = $collection.getString("date_sent")
    }
    $failedItems += New-Object PSObject -Property $item
}

# Re-queue the failed items
foreach ($item in $failedItems) {
    $requeueQuery = "UPDATE dmi_queue_item OBJECTS SET task_state = 'waiting' WHERE r_object_id = '" + $item."Object ID" + "'"
    $session.execute($requeueQuery, $null)
}

# Release session
$session.disconnect()

Write-Output "Failed items identified and re-queued successfully."

#Make sure to replace "C:\Path\To\Documentum\dfc.jar" and "C:\Path\To\Documentum\dfcbase.jar" with the actual paths to your Documentum libraries, and update the repository name, username, and password accordingly.
