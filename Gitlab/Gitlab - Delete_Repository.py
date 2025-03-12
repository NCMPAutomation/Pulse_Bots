import requests

# Replace these values with your information
GITLAB_BASE_URL = "https://gitlab.com"  # Use your GitLab instance URL
PRIVATE_TOKEN = "your_access_token"     # Your GitLab Personal Access Token
PROJECT_ID = "your_project_id"          # Project ID of the repository to delete

def delete_gitlab_repo(base_url, private_token, project_id):
    url = f"{base_url}/api/v4/projects/{project_id}"
    headers = {
        "PRIVATE-TOKEN": private_token
    }

    response = requests.delete(url, headers=headers)

    if response.status_code == 202:
        print(f"Repository with project ID {project_id} has been successfully deleted.")
    elif response.status_code == 404:
        print(f"Repository with project ID {project_id} not found.")
    else:
        print(f"Failed to delete repository. Status code: {response.status_code}")
        print(f"Response: {response.text}")

# Call the function
delete_gitlab_repo(GITLAB_BASE_URL, PRIVATE_TOKEN, PROJECT_ID)
