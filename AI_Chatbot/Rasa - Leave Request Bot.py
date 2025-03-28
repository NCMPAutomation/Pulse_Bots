# This bot handles leave requests from employees.

from rasa_sdk import Action

class ActionLeaveRequest(Action):
    def name(self):
        # Naming the action
        return "action_leave_request"

    def run(self, dispatcher, tracker, domain):
        # Extract leave details from user input
        start_date = tracker.get_slot("start_date")
        end_date = tracker.get_slot("end_date")
        reason = tracker.get_slot("reason")
        # Confirm the leave request
        response = f"Your leave request from {start_date} to {end_date} for '{reason}' has been submitted."
        dispatcher.utter_message(text=response)
        return []