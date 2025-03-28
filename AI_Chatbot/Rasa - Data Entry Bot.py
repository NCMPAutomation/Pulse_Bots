# This bot collects data entries for admin purposes.

from rasa_sdk import Action

class ActionDataEntry(Action):
    def name(self):
        # Naming the action
        return "action_data_entry"

    def run(self, dispatcher, tracker, domain):
        # Collect data from the user
        field_1 = tracker.get_slot("field_1")
        field_2 = tracker.get_slot("field_2")
        # Confirm data entry
        response = f"Data entry completed with Field 1: {field_1} and Field 2: {field_2}."
        dispatcher.utter_message(text=response)
        return []