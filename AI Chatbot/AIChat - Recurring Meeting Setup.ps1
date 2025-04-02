import jarvis_si

def setup_recurring_meeting(participants, start_date, time, duration, recurrence):
    recurring_meeting = jarvis_si.create_recurring_meeting(
        participants=participants,
        start_date=start_date,
        time=time,
        duration=duration,
        recurrence=recurrence
    )
    return recurring_meeting

participants = ["alice@example.com", "bob@example.com"]
start_date = "2025-04-01"
time = "10:00 AM"
duration = "1 hour"
recurrence = "weekly"

recurring_meeting_details = setup_recurring_meeting(participants, start_date, time, duration, recurrence)
print(recurring_meeting_details)
