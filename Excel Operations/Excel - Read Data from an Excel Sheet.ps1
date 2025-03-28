# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open an existing workbook
$workbook = $excel.Workbooks.Open("C:\Temp\NewWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)  # Select the first sheet

# Read data from specific cells
$name = $sheet.Cells.Item(2,1).Value
$age = $sheet.Cells.Item(2,2).Value

# Output the data
Write-Host "Name: $name, Age: $age"

# Cleanup resources
$excel.Quit()