# Check if emails contain attachments
for email_id in unread_emails[0].split():
    status, email_data = mail.fetch(email_id, "(RFC822)")
    raw_email = email_data[0][1]
    parsed_email = email.message_from_bytes(raw_email)

    # Loop through email parts to check for attachments
    for part in parsed_email.walk():
        if part.get_content_disposition() == "attachment":
            print(f"Email with attachment: {parsed_email['Subject']}")