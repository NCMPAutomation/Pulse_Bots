# This is a chatbot to answer frequently asked questions.

from rasa_sdk import Action

class ActionFAQ(Action):
    def name(self):
        # Naming the action
        return "action_faq"

    def run(self, dispatcher, tracker, domain):
        # Extract FAQ intent (e.g., delivery policy, return policy)
        faq_query = tracker.get_intent_of_latest_message()
        # Provide a predefined answer
        if faq_query == "ask_delivery":
            response = "Our delivery usually takes 3-5 business days."
        elif faq_query == "ask_return":
            response = "Returns can be processed within 30 days of purchase."
        else:
            response = "I'm not sure about that. Let me get back to you!"
        dispatcher.utter_message(text=response)
        return []