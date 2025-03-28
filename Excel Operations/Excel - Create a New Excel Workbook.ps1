# Import the Excel COM object
$excel = New-Object -ComObject Excel.Application

# Create a new workbook
$workbook = $excel.Workbooks.Add()

# Make Excel visible to the user
$excel.Visible = $true

# Save the workbook
$workbook.SaveAs("C:\Temp\NewWorkbook.xlsx")

# Cleanup resources
$excel.Quit()