# Ticket creation in Jira SD
 
#create ticket in service desk
import requests
 
import base64
 
import json
# Jira instance details
 
base_url = "https://netconjira.atlassian.net"
 
api_token = "ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030"
 
admin_email = "platform@netcon.in"
# Issue details
 
project_key = "PROJ"
 
summary = "Sample Issue Summary"
 
description = "Detailed description of the issue."
 
issue_type = "Task"  # Common issue types: "Bug", "Task", "Service Request", etc.
# API endpoint for creating issues
 
url = f"{base_url}/rest/api/3/issue"
# Create Basic Auth header
 
auth_str = f"{admin_email}:{api_token}"
 
b64_auth_str = base64.b64encode(auth_str.encode()).decode()
# Headers for authentication
 
headers = {
 
    "Content-Type": "application/json",
 
    "Authorization": f"Basic {b64_auth_str}"
 
}
# Data for creating the issue
 
issue_data = {
 
    "fields": {
 
        "project": {
 
            "key": project_key
 
        },
 
        "summary": summary,
 
        "description": description,
 
        "issuetype": {
 
            "name": issue_type
 
        }
 
    }
 
}
# Sending POST request
 
response = requests.post(url, headers=headers, data=json.dumps(issue_data))
# Handling the response
 
if response.status_code == 201:
 
    print("Issue created successfully!")
 
    issue_key = response.json()["key"]
 
    print(f"Issue Key: {issue_key}")
 
else:
 
    print(f"Error: {response.status_code} - {response.text}")