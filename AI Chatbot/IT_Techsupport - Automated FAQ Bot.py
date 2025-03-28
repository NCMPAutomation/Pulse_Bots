# Predefined FAQ list
faq = {
    "What are office hours?": "Office hours are from 9 AM to 6 PM, Monday through Friday.",
    "How to reset my password?": "Click on 'Forgot Password' on the login page and follow the instructions.",
    "How to connect to VPN?": "Use the VPN software provided by IT and log in using your credentials.",
    "Where to raise a support ticket?": "You can raise a ticket at support.company.com."
}

# Function for FAQ bot
def faq_bot():
    print("Welcome to the IT FAQ Bot!")
    while True:
        question = input("Ask your question (type 'exit' to quit): ").strip()
        if question.lower() == "exit":
            print("Thank you for using the IT FAQ Bot. Goodbye!")
            break
        answer = faq.get(question, "I don't have an answer to that. Please check the IT support portal.")
        print(answer)

# Start chatbot
faq_bot()