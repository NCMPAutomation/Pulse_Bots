import json
import requests

# Function to handle leave request
def process_leave_request(employee_id, leave_type, start_date, end_date):
    """
    Processes leave requests for employees.
    Args:
        employee_id (str): The unique identifier of the employee.
        leave_type (str): Type of leave (e.g., Casual, Sick).
        start_date (str): Start date of the leave.
        end_date (str): End date of the leave.

    Returns:
        str: Response message to confirm leave request.
    """
    # Mock backend call to process leave request
    # Replace with actual API logic
    leave_data = {
        "employee_id": employee_id,
        "leave_type": leave_type,
        "start_date": start_date,
        "end_date": end_date
    }
    
    # Example mock response
    response_message = (
        f"Leave request submitted successfully:\n"
        f"- Employee ID: {employee_id}\n"
        f"- Leave Type: {leave_type}\n"
        f"- Duration: {start_date} to {end_date}"
    )
    return response_message


# Example chatbot interaction
if __name__ == "__main__":
    # Simulate user input
    employee_id = "12345"
    leave_type = "Sick Leave"
    start_date = "2025-04-01"
    end_date = "2025-04-03"
    
    # Process leave request
    response = process_leave_request(employee_id, leave_type, start_date, end_date)
    
    # Display the chatbot response
    print(response)