(Get-Content -Path "C:\Users\Netcon\Downloads\sample_json.json") | ConvertFrom-Json | Export-CSV "C:\Users\Netcon\Downloads\sample_csv.csv" -NoTypeInformation
