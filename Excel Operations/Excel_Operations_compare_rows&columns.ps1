# Load the Excel COM objects
$excel = New-Object -ComObject Excel.Application

# Open the destination Excel file
$destinationWorkbook = $excel.Workbooks.Open("F:\temp\ExcelPS\compare.xlsx")
$destinationWorksheet = $destinationWorkbook.Sheets.Item(1)

# Open the source Excel file for reference
$sourceWorkbook = $excel.Workbooks.Open("F:\temp\ExcelPS\main.xlsx")
$sourceWorksheet = $sourceWorkbook.Sheets.Item(1)

# Get the last row in both source and destination worksheets
$lastRowSource = $sourceWorksheet.UsedRange.Rows.Count
$lastRowDestination = $destinationWorksheet.UsedRange.Rows.Count

# Loop through each row in the destination worksheet (assuming data starts from the second row)
for ($rowDestination = 2; $rowDestination -le $lastRowDestination; $rowDestination++) {
    # Get cell address, i.e. A2, B3, etc.
    $lookupValue = $destinationWorksheet.Cells.Item($rowDestination, 1).Address(0,0)

    # Construct the VLOOKUP formula string with the source Excel file reference
    #$formula = "=IFNA(VLOOKUP($lookupValue," + $sourceWorksheet.Name + '!$A$1:$A'+$lastRowSource+',1,FALSE), "NO")'
    $formula = "=IF(IFNA(VLOOKUP($lookupValue," + "[$($sourceWorkbook.Name)]" + $sourceWorksheet.Name + '!$A$1:$A'+$lastRowSource+',1,FALSE), "NO") = "NO", "NO", "YES")'

    # Get the adjacent cell to set the formula
    $destinationCell = $destinationWorksheet.Cells.Item($rowDestination, 2)
    $destinationCell.Formula = $formula         # Set formula
    $destinationCell.NumberFormat = "General"   # Set cell number formatting
}

# Save changes to the destination Excel file
$destinationWorkbook.Save()

# Close both Excel files
$sourceWorkbook.Close($false)
$destinationWorkbook.Close($false)

# Quit Excel
$excel.Quit()

# Release COM objects, output to null so we don't see 0's.
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sourceWorksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($sourceWorkbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($destinationWorksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($destinationWorkbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null