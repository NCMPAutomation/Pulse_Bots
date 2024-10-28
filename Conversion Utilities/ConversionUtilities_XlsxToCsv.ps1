# Define the path to the Excel file
$excelPath = 'path to file .xlsx'

# Define the path to the output CSV file
$csvPath = "path to csv.csv"

# Create an instance of Excel
$excel = New-Object -ComObject Excel.Application

# Open the Excel workbook
$workbook = $excel.Workbooks.Open($excelPath)

# Select the first worksheet
$worksheet = $workbook.Worksheets.Item(1)

# Save the worksheet as a CSV file
$worksheet.SaveAs($csvPath, 6)  # 6 corresponds to the CSV format

# Close the workbook and quit Excel
$workbook.Close($false)
$excel.Quit()

# Release the COM objects
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null

# Collect garbage
[GC]::Collect()
[GC]::WaitForPendingFinalizers()

Write-Output "Excel file has been converted to CSV successfully."

