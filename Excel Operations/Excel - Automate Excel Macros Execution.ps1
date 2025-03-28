# Import Excel COM object
$excel = New-Object -ComObject Excel.Application

# Open workbook
$workbook = $excel.Workbooks.Open("C:\Temp\MacroEnabledWorkbook.xlsm")

# Execute a macro
$excel.Run("MacroName")

# Cleanup
$excel.Quit()