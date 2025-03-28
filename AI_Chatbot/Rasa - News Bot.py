from rasa_sdk import Action

class ActionNews(Action):
    def name(self):
        # Naming the action
        return "action_news"

    def run(self, dispatcher, tracker, domain):
        # Extract topic of interest from entities
        topic = tracker.get_slot("topic")
        # Mock response for latest news (API call placeholder)
        news_info = f"Here is the latest news about {topic}: The economy is booming."
        # Respond to the user
        dispatcher.utter_message(text=news_info)
        return []