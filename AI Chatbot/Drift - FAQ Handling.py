def handle_faq(question):
    faqs = {
        "What are your hours?": "We are open from 9 AM to 5 PM, Monday to Friday.",
        "How can I contact support?": "You can contact support at support@example.com."
    }
    return faqs.get(question, "I'm sorry, I don't have an answer for that.")

# Example usage
print(handle_faq("What are your hours?"))