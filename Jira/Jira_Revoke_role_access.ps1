Revoke access
 
import requests
 
import base64
 
import json
# Jira instance details
 
base_url = "https://netconjira.atlassian.net"
 
api_token = "ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030"
 
admin_email = "platform@netcon.in"
 
project_key = "PROJ"
 
account_id = "712020:ec11349f-aa5d-41d2-9797-0109d4adfe5c"  # Replace with the actual account ID of the user
# Function to fetch role IDs for a project
 
def get_role_ids(base_url, project_key, headers):
 
    url = f"{base_url}/rest/api/3/project/{project_key}/role"
 
    response = requests.get(url, headers=headers)
 
    if response.status_code == 200:
 
        roles = response.json()
 
        return {role_name: role_url.split('/')[-1] for role_name, role_url in roles.items()}
 
    else:
 
        print(f"Error fetching roles: {response.status_code} - {response.text}")
 
        return None
# Function to remove user from all roles in a project
 
def remove_user_from_project(base_url, project_key, account_id, headers):
 
    role_ids = get_role_ids(base_url, project_key, headers)
 
    if role_ids:
 
        for role_name, role_id in role_ids.items():
 
            url = f"{base_url}/rest/api/3/project/{project_key}/role/{role_id}"
 
            revoke_data = {
 
                "user": [account_id]
 
            }
 
            response = requests.delete(url, headers=headers, json=revoke_data)
 
            if response.status_code == 204:
 
                print(f"User removed successfully from role: {role_name}")
 
            else:
 
                print(f"Error removing user from role {role_name}: {response.status_code} - {response.text}")
# Create Basic Auth header
 
auth_str = f"{admin_email}:{api_token}"
 
b64_auth_str = base64.b64encode(auth_str.encode()).decode()
headers = {
 
    "Content-Type": "application/json",
 
    "Authorization": f"Basic {b64_auth_str}"
 
}
# Remove the user from the project
 
remove_user_from_project(base_url, project_key, account_id, headers)