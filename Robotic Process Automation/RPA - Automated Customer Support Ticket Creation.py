# Import necessary libraries
import requests

# Define the API endpoint and headers
api_endpoint = 'https://example.com/api/tickets'
headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer your_api_token'
}

# Define the ticket details
ticket_data = {
    'subject': 'Issue with Product X',
    'description': 'Customer is experiencing an issue with Product X. Details: ...',
    'priority': 'High',
    'status': 'Open',
    'customer_email': 'customer@example.com'
}

# Send a POST request to create the ticket
response = requests.post(api_endpoint, json=ticket_data, headers=headers)

# Check the response status
if response.status_code == 201:
    print('Ticket created successfully.')
else:
    print(f'Failed to create ticket. Status code: {response.status_code}')