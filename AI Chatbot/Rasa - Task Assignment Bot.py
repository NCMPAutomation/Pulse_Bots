# This bot helps assign tasks to team members.

from rasa_sdk import Action

class ActionAssignTask(Action):
    def name(self):
        # Naming the action
        return "action_assign_task"

    def run(self, dispatcher, tracker, domain):
        # Extract task details from user input
        task = tracker.get_slot("task")
        assignee = tracker.get_slot("assignee")
        deadline = tracker.get_slot("deadline")
        # Provide confirmation
        response = f"The task '{task}' has been assigned to {assignee} with a deadline of {deadline}."
        dispatcher.utter_message(text=response)
        return []