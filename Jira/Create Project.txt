
 
import requests

from requests.auth import HTTPBasicAuth

import json
 
# Jira instance details

base_url = "https://netconjira.atlassian.net"

username = "platform@netcon.in"

api_token = "ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030"
 
# Get account ID of the project lead

user_email = "platform@netcon.in"

user_url = f"{base_url}/rest/api/3/user/search?query={user_email}"
 
headers = {

    "Content-Type": "application/json"

}
 
response = requests.get(

    user_url,

    headers=headers,

    auth=HTTPBasicAuth(username, api_token)

)
 
if response.status_code == 200:

    account_id = response.json()[0]['accountId']

else:

    print(f"Failed to get account ID. Status code: {response.status_code}")

    print(f"Response: {response.text}")

    exit()
 
# Project details

project_name = "NewProject"

project_key = "NP"

project_type = "software"

project_template_key = "com.pyxis.greenhopper.jira:gh-simplified-scrum-classic"
 
# API endpoint

url = f"{base_url}/rest/api/2/project"
 
# Request payload

payload = {

    "key": project_key,

    "name": project_name,

    "projectTypeKey": project_type,

    "projectTemplateKey": project_template_key,

    "leadAccountId": account_id

}
 
# Make the request to create the project

response = requests.post(

    url,

    data=json.dumps(payload),

    headers=headers,

    auth=HTTPBasicAuth(username, api_token)

)
 
# Check the response

if response.status_code == 201:

    print("Project created successfully.")

else:

    print(f"Failed to create project. Status code: {response.status_code}")

    print(f"Response: {response.text}")

 