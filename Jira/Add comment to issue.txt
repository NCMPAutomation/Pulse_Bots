#Adding comment to an issue
 
import requests
from requests.auth import HTTPBasicAuth
import json
 
# Replace these variables with your Jira instance details
jira_url = 'https://netconjira.atlassian.net'
username = 'platform@netcon.in'
api_token = 'ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030'
issue_key = 'PROJ-1'  # The key of the issue you want to comment on
 
# Comment details in ADF format
comment = {
    "body": {
        "type": "doc",
        "version": 1,
        "content": [
            {
                "type": "paragraph",
                "content": [
                    {
                        "type": "text",
                        "text": "This is a comment added via the Jira REST API."
                    }
                ]
            }
        ]
    }
}
 
# Construct the URL for the issue comment endpoint
url = f'{jira_url}/rest/api/3/issue/{issue_key}/comment'
 
# Make the POST request to add the comment
response = requests.post(url, auth=HTTPBasicAuth(username, api_token), headers={'Content-Type': 'application/json'}, data=json.dumps(comment))
 
# Check the response status
if response.status_code == 201:
    print('Comment added successfully.')
else:
    print(f'Failed to add comment. Status code: {response.status_code}')
    print(response.text)