# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")

# Save each sheet as a separate workbook
foreach ($sheet in $workbook.Sheets) {
    $newWorkbook = $excel.Workbooks.Add()
    $newSheet = $newWorkbook.Sheets.Item(1)
    $sheet.UsedRange.Copy()
    $newSheet.Paste()
    $newWorkbook.SaveAs("C:\Temp\" + $sheet.Name + ".xlsx")
    $newWorkbook.Close()
}

# Cleanup
$excel.Quit()