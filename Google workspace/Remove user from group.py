from google.oauth2 import service_account
from googleapiclient.discovery import build

# Path to your service account key file
SERVICE_ACCOUNT_FILE = 'path/to/service_account.json'

# Define the required scopes
SCOPES = ['https://www.googleapis.com/auth/admin.directory.group.member']

# Authenticate and build the service
credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE, scopes=SCOPES)
service = build('admin', 'directory_v1', credentials=credentials)

# Group and user information
group_email = "group@example.com"
user_email = "user@example.com"

# Remove the user from the group
try:
    service.members().delete(groupKey=group_email, memberKey=user_email).execute()
    print(f'User {user_email} removed from group {group_email}')
except Exception as e:
    print(f'An error occurred: {e}')
