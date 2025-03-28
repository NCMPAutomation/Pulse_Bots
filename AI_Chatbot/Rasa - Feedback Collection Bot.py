# This chatbot collects feedback from users.

from rasa_sdk import Action

class ActionCollectFeedback(Action):
    def name(self):
        # Naming the action
        return "action_collect_feedback"
    
    def run(self, dispatcher, tracker, domain):
        # Ask the user for feedback
        response = "Thank you for using our service. Could you provide feedback on your experience?"
        dispatcher.utter_message(text=response)
        return []