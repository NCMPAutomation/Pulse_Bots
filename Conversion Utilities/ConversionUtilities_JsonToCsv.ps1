$jsonData = Get-Content -Path "C:\MyFolder\data.json" -Raw | ConvertFrom-Json
$jsonData | ConvertTo-Csv
