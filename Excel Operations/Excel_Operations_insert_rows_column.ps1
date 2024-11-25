$excel = New-Object -ComObject excel.application
$excel.visible = $True
$workbook = $excel.Workbooks.Add()
$workbook.Worksheets.Add()
$Data= $workbook.Worksheets.Item(1)
$Data.Name = 'MySpreadsheet'
$Data.Cells.Item(1,1) = 'Asset Name'
$Data.Cells.Item(1,2) = 'HostName'

# Insert Data   
$Data.Cells.Item(3,1) = "MyAssetName"
$Data.Cells.Item(3,2) = "MyHostName"

# Format, save and quit excel
$usedRange = $Data.UsedRange                                                                                              
$usedRange.EntireColumn.AutoFit() | Out-Null
$workbook.SaveAs("C:\MyExcel.xlsx")
$excel.Quit()