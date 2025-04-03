import requests
import json

# Replace these with your GitLab detail
GITLAB_URL = 'https://gitlab.com'
PRIVATE_TOKEN = 'glpat-XwtMyDPMD2setHr2FMoj'
PROJECT_NAME = 'Test_project'
NAMESPACE = 'New namespace'  # Add your namespace here

# API endpoint to create a project
url = f"{GITLAB_URL}/api/v4/projects"

# Headers for the request
headers = {
    'Private-Token': PRIVATE_TOKEN
}

# Data for the new project
data = {
    'name': PROJECT_NAME,
    'namespace_id': NAMESPACE,  # Specify the namespace ID or path
    'visibility': 'public'  # You can set this to 'public' if you want
}

# Make the request to create the project
response = requests.post(url, headers=headers, data=data)

if response.status_code == 201:
    print(f"Project '{PROJECT_NAME}' created successfully!")
    print(response.json())
else:
    print(f"Failed to create project. Status code: {response.status_code}")
    print(response.json())
