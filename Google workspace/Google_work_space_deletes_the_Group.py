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

# Group email to delete
group_email = 'group@example.com'

# Delete the group
try:
    service.groups().delete(groupKey=group_email).execute()
    print(f'Group deleted: {group_email}')
except Exception as e:
    print(f'An error occurred: {e}')
