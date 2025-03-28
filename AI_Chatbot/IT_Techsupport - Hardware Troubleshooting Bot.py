# Function for hardware-related troubleshooting
def hardware_bot():
    print("Welcome to Hardware Troubleshooting Bot!")
    while True:
        query = input("Describe your hardware issue (type 'exit' to quit): ").strip()
        if query.lower() == "exit":
            print("Thank you for using the Hardware Bot. Goodbye!")
            break
        elif "mouse" in query.lower():
            print("Try reconnecting the mouse or checking the battery.")
        elif "keyboard" in query.lower():
            print("Ensure the keyboard is plugged in or replace the batteries for wireless keyboards.")
        elif "monitor" in query.lower():
            print("Check the power cable and connection to the CPU.")
        else:
            print("I'm unable to troubleshoot this specific issue. Please contact support.")

# Start chatbot
hardware_bot()