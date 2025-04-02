# Import necessary libraries
from fpdf import FPDF

# Define the invoice details
invoice_details = {
    'invoice_number': '12345',
    'date': '2025-03-27',
    'customer_name': 'John Doe',
    'items': [
        {'description': 'Product 1', 'quantity': 2, 'price': 50},
        {'description': 'Product 2', 'quantity': 1, 'price': 100}
    ]
}

# Create a PDF object
pdf = FPDF()
pdf.add_page()

# Add the invoice details to the PDF
pdf.set_font('Arial', 'B', 12)
pdf.cell(0, 10, f"Invoice Number: {invoice_details['invoice_number']}", 0, 1)
pdf.cell(0, 10, f"Date: {invoice_details['date']}", 0, 1)
pdf.cell(0, 10, f"Customer Name: {invoice_details['customer_name']}", 0, 1)

# Add the items to the PDF
pdf.set_font('Arial', '', 12)
for item in invoice_details['items']:
    pdf.cell(0, 10, f"{item['description']} - {item['quantity']} x ${item['price']}", 0, 1)

# Save the PDF to a file
pdf.output('invoice.pdf')