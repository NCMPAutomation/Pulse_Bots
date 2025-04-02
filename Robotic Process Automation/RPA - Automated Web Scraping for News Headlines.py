# Import necessary libraries
from selenium import webdriver
from bs4 import BeautifulSoup

# Set up the web driver
driver = webdriver.Chrome()

# Open the news website
driver.get('https://example.com/news')

# Get the page source
page_source = driver.page_source

# Parse the page source with BeautifulSoup
soup = BeautifulSoup(page_source, 'html.parser')

# Find all news headlines
headlines = soup.find_all(class_='headline')

# Print each headline
for headline in headlines:
    print(headline.text)

# Close the web driver
driver.quit()