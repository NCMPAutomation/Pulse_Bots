# Import necessary libraries
from selenium import webdriver

# Set up the web driver
driver = webdriver.Chrome()

# Open the web form
driver.get('https://example.com/form')

# Fill in the form fields
driver.find_element_by_name('name').send_keys('John Doe')
driver.find_element_by_name('email').send_keys('john.doe@example.com')
driver.find_element_by_name('submit').click()

# Close the web driver
driver.quit()