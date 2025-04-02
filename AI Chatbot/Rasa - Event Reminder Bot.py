# This bot sets reminders for upcoming events.

from rasa_sdk import Action

class ActionSetReminder(Action):
    def name(self):
        # Naming the action
        return "action_set_reminder"

    def run(self, dispatcher, tracker, domain):
        # Extract event details
        event = tracker.get_slot("event")
        date = tracker.get_slot("date")
        time = tracker.get_slot("time")
        # Confirm the reminder
        response = f"A reminder for '{event}' has been set for {date} at {time}."
        dispatcher.utter_message(text=response)
        return []