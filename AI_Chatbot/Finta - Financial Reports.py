import csv

def generate_financial_report(data_file_path):
    with open(data_file_path, mode='r') as file:
        reader = csv.reader(file)
        data = list(reader)
    report_content = "Financial Report\n"
    for record in data:
        report_content += f"{record[0]}: {record[1]} - {record[2]}\n"
    with open('financial_report.txt', 'w') as file:
        file.write(report_content)
    return "Financial report generated successfully."

# Example usage
print(generate_financial_report('financial_data.csv'))