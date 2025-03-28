# This is a chatbot designed to handle customer support queries.

from rasa_sdk import Action

class ActionCustomerSupport(Action):
    def name(self):
        # Naming the action
        return "action_customer_support"
    
    def run(self, dispatcher, tracker, domain):
        # Extract user intent and query
        user_query = tracker.latest_message.get("text")
        # Provide a response
        response = "I'm here to help with any issues you have! Could you provide more details?"
        # Send the response back to the user
        dispatcher.utter_message(text=response)
        return []