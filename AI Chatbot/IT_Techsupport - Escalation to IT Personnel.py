# Function to handle user queries and escalate complex issues
def it_escalation_bot():
    print("Welcome to IT Support Bot with Escalation!")
    while True:
        query = input("Your IT issue (type 'exit' to quit): ").strip()
        if query.lower() == "exit":
            print("Thank you for using IT Support Bot. Goodbye!")
            break
        elif "complex" in query.lower() or "urgent" in query.lower():
            print("This seems like a complex issue. Escalating to IT personnel...")
            print("An IT representative will contact you shortly.")
        else:
            print("I'm not sure about that issue. Please contact IT support directly.")

# Start chatbot
it_escalation_bot()