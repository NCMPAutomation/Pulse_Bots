# Create an Excel report from CSV data
Add-Type -AssemblyName Microsoft.Office.Interop.Excel
$Excel = New-Object -ComObject Excel.Application
$Workbook = $Excel.Workbooks.Add()
$Sheet = $Workbook.Sheets.Item(1)
$Data = Import-Csv "C:\Data\ReportData.csv"
$row = 1
foreach ($Record in $Data) {
    $Sheet.Cells.Item($row, 1).Value = $Record.Name
    $Sheet.Cells.Item($row, 2).Value = $Record.Value
    $row++
}
$Workbook.SaveAs("C:\Data\ExcelReport.xlsx")
$Excel.Quit()
Write-Output "Excel report created."