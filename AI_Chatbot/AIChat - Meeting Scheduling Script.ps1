import jarvis_si

def schedule_meeting(participants, date, time, duration):
    meeting = jarvis_si.create_meeting(
        participants=participants,
        date=date,
        time=time,
        duration=duration
    )
    return meeting

participants = ["alice@example.com", "bob@example.com"]
date = "2025-04-01"
time = "10:00 AM"
duration = "1 hour"

meeting_details = schedule_meeting(participants, date, time, duration)
print(meeting_details)
