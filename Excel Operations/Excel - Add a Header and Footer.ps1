# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Add header and footer
$sheet.PageSetup.LeftHeader = "Company Name"
$sheet.PageSetup.RightFooter = "Confidential"

# Save and cleanup
$workbook.Save()
$excel.Quit()