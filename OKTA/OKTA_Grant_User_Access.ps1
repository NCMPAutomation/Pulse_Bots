$OktaOrgUrl = "https://trial-8519316.okta.com"
$ApiToken = ""
$Configuration = @{
    OktaDomain = $OktaOrgUrl
    ApiToken = $ApiToken
}
 
# Define user and application details
$UserId = "00unpbw1s4J4rLTO0697"
$AppId = "0oanssxwibIceJtQV697"
 
# Assign user to application
$Body = @{
    id = $UserId
}
 
Invoke-RestMethod -Method Post -Uri "$OktaOrgUrl/api/v1/apps/$AppId/users" -Headers @{
    "Authorization" = "SSWS $ApiToken"
    "Accept" = "application/json"
    "Content-Type" = "application/json"
} -Body ($Body | ConvertTo-Json)