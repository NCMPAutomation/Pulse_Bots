# Importing necessary library
import random

# Predefined dictionary of common IT issues and their solutions
it_support = {
    "WiFi not working": "Try restarting your router. If the problem persists, contact your ISP.",
    "Forgotten password": "Use the 'Forgot Password' option to reset it.",
    "Computer slow": "Consider clearing cache, deleting unnecessary files, or upgrading hardware.",
    "Software installation issue": "Check if your system meets the software requirements or try reinstalling.",
    "Printer not working": "Ensure the printer is connected, powered on, and has enough paper and ink."
}

# Function to handle user queries
def it_chatbot():
    print("Welcome to IT Support Bot! Ask me about common IT issues.")
    while True:
        query = input("Your query (type 'exit' to quit): ").strip()
        if query.lower() == "exit":
            print("Thank you for using IT Support Bot. Goodbye!")
            break
        # Fetching an appropriate response
        response = it_support.get(query, "I'm not sure about that issue. Please contact IT support.")
        print(response)

# Start chatbot
it_chatbot()