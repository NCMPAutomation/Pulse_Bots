import jarvis_si

def set_meeting_reminder(meeting_id, reminder_time):
    reminder = jarvis_si.set_reminder(
        meeting_id=meeting_id,
        reminder_time=reminder_time
    )
    return reminder

meeting_id = "12345"
reminder_time = "30 minutes before"

reminder_details = set_meeting_reminder(meeting_id, reminder_time)
print(reminder_details)
