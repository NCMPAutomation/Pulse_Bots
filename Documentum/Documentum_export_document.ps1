# Load Documentum libraries
Add-Type -Path "C:\Path\To\Documentum\dfc.jar"
Add-Type -Path "C:\Path\To\Documentum\dfcbase.jar"

# Initialize Documentum session
$sessionManager = New-Object Documentum.DfClient.DfClientX
$session = $sessionManager.getLocalClient().newSession("repository_name", "username", "password")

# Define the document to export
$objectId = "0900000000000000"
$destinationPath = "C:\Path\To\Export\Document.pdf"

# Fetch the document object
$doc = $session.getObject.(new-object Documentum.DfClient.DfId($objectId))

# Export the document
$exportOperation = $sessionManager.getClientX().getExportOperation()
$exportOperation.setDestinationDirectory($destinationPath)
$exportNode = $exportOperation.add($doc)
$exportNode.setFormat($doc.getFormat().getName())
$exportOperation.execute()

# Release session
$session.disconnect()

Write-Output "Document exported successfully to $destinationPath."


#Replace "C:\Path\To\Documentum\dfc.jar" and "C:\Path\To\Documentum\dfcbase.jar" with the actual paths to your Documentum libraries.