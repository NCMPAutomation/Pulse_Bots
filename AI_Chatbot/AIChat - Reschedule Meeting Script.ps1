import jarvis_si

def reschedule_meeting(meeting_id, new_date, new_time):
    rescheduled_meeting = jarvis_si.reschedule_meeting(
        meeting_id=meeting_id,
        new_date=new_date,
        new_time=new_time
    )
    return rescheduled_meeting

meeting_id = "12345"
new_date = "2025-04-02"
new_time = "11:00 AM"

rescheduled_meeting_details = reschedule_meeting(meeting_id, new_date, new_time)
print(rescheduled_meeting_details)
