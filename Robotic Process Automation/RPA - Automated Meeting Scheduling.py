# Import necessary libraries
import smtplib
from email.mime.text import MIMEText
from datetime import datetime, timedelta

# Define meeting details
meeting_date = datetime.now() + timedelta(days=1)
meeting_details = f"Meeting scheduled for {meeting_date.strftime('%Y-%m-%d %H:%M:%S')}"

# Create the email message
msg = MIMEText(meeting_details)
msg['Subject'] = 'Meeting Schedule'
msg['From'] = 'your_email@example.com'
msg['To'] = 'recipient@example.com'

# Send the email
with smtplib.SMTP('smtp.example.com', 587) as server:
    server.starttls()
    server.login('your_email@example.com', 'your_password')
    server.sendmail('your_email@example.com', 'recipient@example.com', msg.as_string())