# Export data as XML format
$Data = Import-Csv "C:\Data\ReportData.csv"
$XmlData = $Data | ConvertTo-Xml
$XmlData.Save("C:\Data\ReportData.xml")
Write-Output "XML report saved."