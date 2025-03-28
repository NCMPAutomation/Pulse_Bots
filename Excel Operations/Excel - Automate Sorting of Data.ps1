# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Sort data by the first column
$range = $sheet.UsedRange
$range.Sort($range.Columns(1), 1)

# Save and cleanup
$workbook.Save()
$excel.Quit()