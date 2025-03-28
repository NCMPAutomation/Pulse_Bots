from datetime import datetime

def send_payment_reminder(due_date, invoice_number):
    due_date = datetime.strptime(due_date, "%Y-%m-%d")
    if due_date < datetime.now():
        return f"Reminder: Invoice {invoice_number} is overdue."
    else:
        return f"Invoice {invoice_number} is due on {due_date.strftime('%Y-%m-%d')}."

# Example usage
print(send_payment_reminder("2025-03-15", "INV001"))