# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Apply conditional formatting to highlight values greater than 50
$range = $sheet.Range("B2:B10")
$format = $range.FormatConditions.Add(1, 1, ">50")
$format.Interior.Color = 255  # Red

# Save and cleanup
$workbook.Save()
$excel.Quit()