#User creation
 
import requests
 
from requests.auth import HTTPBasicAuth
 
import json
# Base URL and API token
 
base_url = "https://netconjira.atlassian.net"
 
api_token = "ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030"
 
user_email = "platform@netcon.in"
# API endpoint for creating a user
 
url = f"{base_url}/rest/api/3/user"
# User data
 
user_data = {
 
    "emailAddress": "Sreesutha.as@netcon.in",
 
    "displayName": "Sreesutha",
 
    "password": "UserPassword123",
 
    "notification": "false",
 
    "applicationKeys": ["jira-software"]
 
}
# Products field to specify access
 
user_data['products'] = [
 
    {
 
        "productKey": "jira-software"
 
    }
 
]
# Headers for authentication
 
headers = {
 
    "Content-Type": "application/json"
 
}
# Sending POST request
 
response = requests.post(url, headers=headers, auth=HTTPBasicAuth(user_email, api_token), data=json.dumps(user_data))
# Handling the response
 
if response.status_code == 201:
 
    print("User created successfully!")
 
else:
 
    print(f"Error: {response.status_code} - {response.text}")
 