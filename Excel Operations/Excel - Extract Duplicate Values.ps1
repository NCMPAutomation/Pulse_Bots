# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\DataWorkbook.xlsx")
$sheet = $workbook.Sheets.Item(1)

# Identify and extract duplicate values in column A
$duplicates = @{}
for ($row = 1; $row -le $sheet.UsedRange.Rows.Count; $row++) {
    $value = $sheet.Cells.Item($row, 1).Value
    if ($duplicates.ContainsKey($value)) {
        $sheet.Cells.Item($row, 2).Value = "Duplicate"
    } else {
        $duplicates[$value] = $true
    }
}

# Save and cleanup
$workbook.Save()
$excel.Quit()