# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Lock specific cells
$range = $sheet.Range("A1:B2")
$range.Locked = $true
$sheet.Protect("SecurePassword")

# Save and cleanup
$workbook.Save()
$excel.Quit()