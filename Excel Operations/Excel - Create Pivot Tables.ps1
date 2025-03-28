# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook and get data
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$dataSheet = $workbook.Sheets.Item(1)

# Add Pivot Table
$pivotSheet = $workbook.Sheets.Add()
$pivotTableRange = $pivotSheet.Cells.Item(1,1)
$pivotTable = $workbook.PivotTableWizard(1, $dataSheet.UsedRange, $pivotTableRange)

# Save and cleanup
$workbook.Save()
$excel.Quit()