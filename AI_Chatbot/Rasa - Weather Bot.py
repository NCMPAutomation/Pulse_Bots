# This is a chatbot to provide weather information.

from rasa_sdk import Action
import requests

class ActionWeather(Action):
    def name(self):
        # Naming the action
        return "action_weather"

    def run(self, dispatcher, tracker, domain):
        # Extract user's location from entities
        location = tracker.get_slot("location")
        # Call a weather API (mock example for demonstration)
        weather_info = f"The weather in {location} is sunny and 25°C."
        # Respond to the user
        dispatcher.utter_message(text=weather_info)
        return []