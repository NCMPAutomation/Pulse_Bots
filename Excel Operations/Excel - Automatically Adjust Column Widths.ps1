# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Auto-fit columns based on content
$sheet.UsedRange.Columns.AutoFit()

# Save and cleanup
$workbook.Save()
$excel.Quit()