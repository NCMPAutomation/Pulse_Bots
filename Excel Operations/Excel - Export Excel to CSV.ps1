# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")

# Save as CSV
$workbook.SaveAs("C:\Temp\DataWorkbook.csv", 6)

# Cleanup
$excel.Quit()