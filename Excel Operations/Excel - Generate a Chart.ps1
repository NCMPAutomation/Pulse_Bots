# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open an existing workbook
$workbook = $excel.Workbooks.Open("C:\Temp\NewWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Add a chart to the sheet
$chart = $workbook.Charts.Add()
$chart.ChartType = 51  # xlColumnClustered
$chart.SetSourceData($sheet.Range("A1:B2"))

# Save and cleanup
$workbook.Save()
$excel.Quit()