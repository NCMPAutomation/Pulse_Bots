import csv

def forecast_expenses(expense_file_path):
    with open(expense_file_path, mode='r') as file:
        reader = csv.reader(file)
        expenses = list(reader)
    average_expenses = sum(float(expense[2]) for expense in expenses) / len(expenses)
    forecasted_expenses = average_expenses * 1.05  # Assuming a 5% increase
    return f"Forecasted Expenses for Next Month: {forecasted_expenses}"

# Example usage
print(forecast_expenses('expenses.csv'))