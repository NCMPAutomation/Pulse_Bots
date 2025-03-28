# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Create a new workbook for merged data
$mergedWorkbook = $excel.Workbooks.Add()
$mergedSheet = $mergedWorkbook.Sheets.Item(1)

# Folder containing Excel files
$folderPath = "C:\Temp\ExcelFiles"

# Get all Excel files in the folder
$files = Get-ChildItem $folderPath -Filter "*.xlsx"

$row = 1  # Start writing to the first row in the new workbook
foreach ($file in $files) {
    # Open each workbook
    $workbook = $excel.Workbooks.Open($file.FullName)
    $sheet = $workbook.Sheets.Item(1)

    # Read used range and write to the new workbook
    $data = $sheet.UsedRange
    foreach ($cell in $data) {
        $mergedSheet.Cells.Item($row, $cell.Column).Value = $cell.Value
    }
    $row += $data.Rows.Count

    # Close the workbook
    $workbook.Close()
}

# Save the merged workbook
$mergedWorkbook.SaveAs("C:\Temp\MergedWorkbook.xlsx")
$excel.Quit()