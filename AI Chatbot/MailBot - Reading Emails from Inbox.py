# Import necessary modules
import imaplib
import email

# Connect to the email server
mail = imaplib.IMAP4_SSL("imap.gmail.com")
mail.login("your_email@gmail.com", "your_password")

# Select the inbox
mail.select("inbox")

# Search for all unread emails
status, unread_emails = mail.search(None, "UNSEEN")

# Loop through emails and read their content
for email_id in unread_emails[0].split():
    # Fetch the email
    status, email_data = mail.fetch(email_id, "(RFC822)")
    raw_email = email_data[0][1]
    parsed_email = email.message_from_bytes(raw_email)
    
    # Extract email details
    sender = parsed_email["From"]
    subject = parsed_email["Subject"]
    body = parsed_email.get_payload(decode=True).decode()

    print(f"Sender: {sender}")
    print(f"Subject: {subject}")
    print(f"Body: {body}")

# Logout from the server
mail.logout()