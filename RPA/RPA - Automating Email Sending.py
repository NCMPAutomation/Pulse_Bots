# Import necessary libraries
import smtplib
from email.mime.text import MIMEText

# Define email parameters
sender = 'your_email@example.com'
receiver = 'recipient@example.com'
subject = 'Automated Email'
body = 'This is an automated email sent by an RPA script.'

# Create the email message
msg = MIMEText(body)
msg['Subject'] = subject
msg['From'] = sender
msg['To'] = receiver

# Send the email
with smtplib.SMTP('smtp.example.com', 587) as server:
    server.starttls()
    server.login(sender, 'your_password')
    server.sendmail(sender, receiver, msg.as_string())