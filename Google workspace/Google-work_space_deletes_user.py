from google.oauth2 import service_account
from googleapiclient.discovery import build

# Path to your service account key file
SERVICE_ACCOUNT_FILE = 'path/to/service_account.json'

# Define the required scopes
SCOPES = ['https://www.googleapis.com/auth/admin.directory.user']

# Authenticate and build the service
credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE, scopes=SCOPES)
service = build('admin', 'directory_v1', credentials=credentials)

# User email to delete
user_email = 'user@example.com'

# Delete the user
try:
    service.users().delete(userKey=user_email).execute()
    print(f'User deleted: {user_email}')
except Exception as e:
    print(f'An error occurred: {e}')
