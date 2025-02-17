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

# User details to add to the group
member_info = {
    "email": user_email,
    "role": "MEMBER"  # Can be "MEMBER", "OWNER", or "MANAGER"
}

# Add the user to the group
try:
    member = service.members().insert(groupKey=group_email, body=member_info).execute()
    print(f'User {user_email} added to group {group_email}')
except Exception as e:
    print(f'An error occurred: {e}')
