#Close issue
 
import requests
from requests.auth import HTTPBasicAuth
import json
 
# Replace these variables with your Jira instance details
jira_url = 'https://netconjira.atlassian.net'
username = 'platform@netcon.in'
api_token = 'ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030'
issue_key = 'PROJ-1'  # The key of the issue you want to close
 
# Transition ID for closing the issue (you may need to find the correct ID for your workflow)
transition_id = '31'  # Example transition ID for closing an issue
 
# Construct the URL for the issue transition endpoint
url = f'{jira_url}/rest/api/3/issue/{issue_key}/transitions'
 
# Data for the transition
data = {
    "transition": {
        "id": transition_id
    }
}
 
# Make the POST request to transition the issue
response = requests.post(url, auth=HTTPBasicAuth(username, api_token), headers={'Content-Type': 'application/json'}, data=json.dumps(data))
 
# Check the response status
if response.status_code == 204:
    print('Issue closed successfully.')
else:
    print(f'Failed to close issue. Status code: {response.status_code}')
    print(response.text)