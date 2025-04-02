from datetime import datetime

def schedule_appointment(name, date_str):
    date = datetime.strptime(date_str, "%Y-%m-%d %H:%M")
    return f"Appointment scheduled for {name} on {date.strftime('%Y-%m-%d %H:%M')}"

# Example usage
print(schedule_appointment("John Doe", "2025-04-01 10:00"))