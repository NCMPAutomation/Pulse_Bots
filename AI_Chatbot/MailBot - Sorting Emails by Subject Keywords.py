# Define keywords for sorting
important_keywords = ["Invoice", "Urgent", "Meeting"]

# Loop through emails and sort based on subject keywords
for email_id in unread_emails[0].split():
    status, email_data = mail.fetch(email_id, "(RFC822)")
    raw_email = email_data[0][1]
    parsed_email = email.message_from_bytes(raw_email)
    
    # Check if the subject contains any important keyword
    subject = parsed_email["Subject"]
    for keyword in important_keywords:
        if keyword in subject:
            print(f"Important Email: {subject}")