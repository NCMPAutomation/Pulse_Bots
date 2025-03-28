# Use Natural Language Processing to summarize email body
from transformers import pipeline

# Load a pre-trained summarization model
summarizer = pipeline("summarization")

# Summarize each email's content
for email_id in unread_emails[0].split():
    status, email_data = mail.fetch(email_id, "(RFC822)")
    raw_email = email_data[0][1]
    parsed_email = email.message_from_bytes(raw_email)

    body = parsed_email.get_payload(decode=True).decode()
    summary = summarizer(body, max_length=50, min_length=20, do_sample=False)

    print(f"Summary: {summary[0]['summary_text']}")