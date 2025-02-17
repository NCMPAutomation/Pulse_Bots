from google.oauth2 import service_account
from googleapiclient.discovery import build

# Path to your service account key file
SERVICE_ACCOUNT_FILE = 'path/to/service_account.json'

# Define the required scopes
SCOPES = ['https://www.googleapis.com/auth/admin.directory.group']

# Authenticate and build the service
credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE, scopes=SCOPES)
service = build('admin', 'directory_v1', credentials=credentials)

# Group information
group_info = {
    "email": "newgroup@example.com",
    "name": "New Group",
    "description": "This is a new group."
}

# Create the group
try:
    group = service.groups().insert(body=group_info).execute()
    print(f'Group created: {group["email"]}')
except Exception as e:
    print(f'An error occurred: {e}')
