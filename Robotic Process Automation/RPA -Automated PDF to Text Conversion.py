# Import necessary libraries
import PyPDF2

# Open the PDF file
with open('document.pdf', 'rb') as file:
    reader = PyPDF2.PdfFileReader(file)
    text = ''

    # Extract text from each page
    for page_num in range(reader.numPages):
        page = reader.getPage(page_num)
        text += page.extract_text()

# Save the extracted text to a file
with open('document.txt', 'w') as text_file:
    text_file.write(text)