# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")

# Protect workbook with password
$workbook.Protect("SecurePassword")

# Save and cleanup
$workbook.Save()
$excel.Quit()