# Connect to SAP system (reuse connection script)

# Define table name and fields
$tableName = "MARA"
$fields = @("MATNR", "MAKTX")

# Create RFC function to read table
$rfcFunction = $sapDestination.Repository.CreateFunction("RFC_READ_TABLE")
$rfcFunction.SetValue("QUERY_TABLE", $tableName)
$rfcFunction.SetValue("FIELDS", $fields)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve data
$data = $rfcFunction.GetTable("DATA")
$data | ForEach-Object { $_.GetValue("WA") }
