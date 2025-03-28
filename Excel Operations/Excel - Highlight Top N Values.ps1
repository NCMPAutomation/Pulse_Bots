# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Highlight top 3 values in column B
$range = $sheet.Range("B2:B10")
$format = $range.FormatConditions.AddTop10()
$format.Rank = 3
$format.Interior.Color = 255  # Red

# Save and cleanup
$workbook.Save()
$excel.Quit()