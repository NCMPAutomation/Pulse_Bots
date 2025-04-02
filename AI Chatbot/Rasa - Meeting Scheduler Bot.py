# This script allows users to schedule meetings by providing date, time, and purpose.

from rasa_sdk import Action

class ActionScheduleMeeting(Action):
    def name(self):
        # Naming the action
        return "action_schedule_meeting"

    def run(self, dispatcher, tracker, domain):
        # Retrieve meeting details from user input
        date = tracker.get_slot("date")
        time = tracker.get_slot("time")
        purpose = tracker.get_slot("purpose")
        # Confirm the meeting
        response = f"Your meeting on '{purpose}' has been scheduled for {date} at {time}."
        dispatcher.utter_message(text=response)
        return []