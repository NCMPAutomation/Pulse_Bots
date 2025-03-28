# Connect to SAP system (reuse connection script)

# Define printer name
$printerName = "PRINTER_NAME"

# Create RFC function to get printer status
$rfcFunction = $sapDestination.Repository.CreateFunction("RSPO_PRINTER_STATUS")
$rfcFunction.SetValue("PRINTER", $printerName)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve printer status
$printerStatus = $rfcFunction.GetStructure("PRINTER_STATUS")
$printerStatus
