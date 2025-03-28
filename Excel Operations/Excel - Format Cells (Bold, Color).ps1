# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open an existing workbook
$workbook = $excel.Workbooks.Open("C:\Temp\NewWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Make the first row bold and apply color
$range = $sheet.Range("A1:B1")
$range.Font.Bold = $true
$range.Interior.ColorIndex = 6  # Yellow background

# Save and cleanup
$workbook.Save()
$excel.Quit()