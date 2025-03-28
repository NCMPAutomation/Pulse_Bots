from googleapiclient.discovery import build
from datetime import datetime

service = build('calendar', 'v3', credentials=your_credentials)
event = {
    'summary': 'Team Meeting',
    'start': {'dateTime': '2025-03-26T14:00:00'},
    'end': {'dateTime': '2025-03-26T15:00:00'}
}
service.events().insert(calendarId='primary', body=event).execute()