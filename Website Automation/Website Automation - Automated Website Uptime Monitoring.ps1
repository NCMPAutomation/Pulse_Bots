# Define the website URL
$url = "https://example.com"

# Check if the website is up
$response = Invoke-WebRequest -Uri $url -UseBasicParsing
if ($response.StatusCode -eq 200) {
    "Website is up" | Out-File "uptime_status.txt"
} else {
    "Website is down" | Out-File "uptime_status.txt"
}