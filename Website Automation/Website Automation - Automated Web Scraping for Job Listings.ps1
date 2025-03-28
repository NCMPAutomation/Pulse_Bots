# Open the browser and navigate to the job listings page
Start-Process "chrome.exe" "https://example.com/jobs"

# Get the page source
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("^a^c")
$pageSource = Get-Clipboard

# Use regex to find all job titles
$jobTitles = [regex]::Matches($pageSource, "class='job-title'>(.*?)<")

# Print each job title
$jobTitles | ForEach-Object { $_.Groups[1].Value }