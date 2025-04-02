from datetime import datetime

# Define invoice details
invoice_number = "INV001"
date = datetime.now().strftime("%Y-%m-%d")
customer = "John Doe"
amount = 150.00

# Create the invoice as a text file
invoice_content = f"""
Invoice Number: {invoice_number}
Date: {date}
Customer: {customer}
Amount: {amount}
"""
with open(f'invoices/{invoice_number}.txt', 'w') as file:
    file.write(invoice_content)