import requests

# Replace these values with your information
GITLAB_BASE_URL = "https://gitlab.com"  # GitLab instance URL
PRIVATE_TOKEN = "your_access_token"     # Your GitLab Personal Access Token
PROJECT_ID = "your_project_id"          # ID of the project/repository
USER_ID = "user_id"                     # User ID to whom you want to grant access
ACCESS_LEVEL = 30                       # Access level (e.g., 10 = Guest, 20 = Reporter, 30 = Developer, 40 = Maintainer, 50 = Owner)

def grant_access_to_gitlab_repo(base_url, private_token, project_id, user_id, access_level):
    url = f"{base_url}/api/v4/projects/{project_id}/members"
    headers = {
        "PRIVATE-TOKEN": private_token
    }
    data = {
        "user_id": user_id,
        "access_level": access_level
    }

    response = requests.post(url, headers=headers, data=data)

    if response.status_code == 201:
        print(f"Access granted to user ID {user_id} for project ID {project_id} with access level {access_level}.")
    elif response.status_code == 404:
        print(f"Project ID {project_id} or user ID {user_id} not found.")
    else:
        print(f"Failed to grant access. Status code: {response.status_code}")
        print(f"Response: {response.text}")

# Call the function
grant_access_to_gitlab_repo(GITLAB_BASE_URL, PRIVATE_TOKEN, PROJECT_ID, USER_ID, ACCESS_LEVEL)
