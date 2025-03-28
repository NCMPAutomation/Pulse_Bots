# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open an existing workbook
$workbook = $excel.Workbooks.Open("C:\Temp\NewWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)  # Select the first sheet

# Add data to cells
$sheet.Cells.Item(1,1).Value = "Name"
$sheet.Cells.Item(1,2).Value = "Age"
$sheet.Cells.Item(2,1).Value = "Alice"
$sheet.Cells.Item(2,2).Value = 25

# Save the workbook
$workbook.Save()

# Cleanup resources
$excel.Quit()