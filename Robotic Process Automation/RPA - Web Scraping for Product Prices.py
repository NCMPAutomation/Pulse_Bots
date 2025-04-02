# Import necessary libraries
from selenium import webdriver
from bs4 import BeautifulSoup

# Set up the web driver
driver = webdriver.Chrome()

# Open the website
driver.get('https://example.com/products')

# Get the page source
page_source = driver.page_source

# Parse the page source with BeautifulSoup
soup = BeautifulSoup(page_source, 'html.parser')

# Find all product prices
prices = soup.find_all(class_='product-price')

# Print each product price
for price in prices:
    print(price.text)

# Close the web driver
driver.quit()