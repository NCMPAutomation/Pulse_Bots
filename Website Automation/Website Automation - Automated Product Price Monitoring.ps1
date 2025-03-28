# Open the browser and navigate to the product page
Start-Process "chrome.exe" "https://example.com/product"

# Extract the product price
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("^a^c")
$price = Get-Clipboard

# Save the price to a file
$price | Out-File "product_price.txt"