# Import modules for sending replies
import smtplib
from email.mime.text import MIMEText

# Define the auto-reply function
def auto_reply(sender_email, subject):
    # Create the reply email
    reply = MIMEText("Thank you for your email. We will get back to you shortly.")
    reply["From"] = "your_email@gmail.com"
    reply["To"] = sender_email
    reply["Subject"] = f"Re: {subject}"

    # Send the reply
    server = smtplib.SMTP_SSL("smtp.gmail.com", 465)
    server.login("your_email@gmail.com", "your_password")
    server.sendmail("your_email@gmail.com", sender_email, reply.as_string())
    server.quit()

    print(f"Auto-reply sent to {sender_email}")