import requests
from requests.auth import HTTPBasicAuth
import json
 
# Jira instance details
base_url = "https://netconjira.atlassian.net"
username = "platform@netcon.in"
api_token = "ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030"
 
# Project and user details
project_key = "10002"
user_account_id = "712020:ec11349f-aa5d-41d2-9797-0109d4adfe5c"
role_id = "10014"  # The ID of the role you want to assign
 
# API endpoint to assign role
url = f"{base_url}/rest/api/3/project/{project_key}/role/{role_id}"
 
# Request payload
payload = {
    "user": [user_account_id]
}
 
# Headers
headers = {
    "Content-Type": "application/json"
}
 
# Make the request to assign the role
response = requests.post(
    url,
    data=json.dumps(payload),
    headers=headers,
    auth=HTTPBasicAuth(username, api_token)
)
 
# Check the response
if response.status_code == 204:
    print("Role assigned successfully.")
else:
    print(f"Failed to assign role. Status code: {response.status_code}")
    print(f"Response: {response.text}")

has context menu