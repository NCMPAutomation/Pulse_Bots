# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open an existing workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Apply a filter to the data
$range = $sheet.UsedRange
$range.AutoFilter(1, "Alice")  # Filter on the first column for "Alice"

# Save and cleanup
$workbook.Save()
$excel.Quit()