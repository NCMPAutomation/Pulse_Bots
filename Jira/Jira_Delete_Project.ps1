# Delete project 
 
import requests
from requests.auth import HTTPBasicAuth
 
# Replace these variables with your Jira instance details
jira_url = 'https://netconjira.atlassian.net'
project_key = 'NP1'
username = 'platform@netcon.in'
api_token = 'ATATT3xFfGF06lnOjiePmCTZdPwzWf-NFJ7biRDS_qdv5_qeZ7Pq7cm_zpH2Kd5IUt_euFXFkLJlwzDUbu3QevX6ayR3O-yzoh_YgFD0ZzcCcJ5IyuhkCmlZfWDJcvZOqIb3IAUrVAm60u07XOrw5Ee-ujTVM1o4v2seGYZs5scu9AFKJPIORUU=71E4B030'
 
# Construct the URL for the project deletion endpoint
url = f'{jira_url}/rest/api/3/project/{project_key}'
 
# Make the DELETE request to delete the project
response = requests.delete(url, auth=HTTPBasicAuth(username, api_token))
 
# Check the response status
if response.status_code == 204:
    print(f'Project {project_key} deleted successfully.')
else:
    print(f'Failed to delete project {project_key}. Status code: {response.status_code}')
    print(response.text)

has context menu