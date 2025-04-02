# Import necessary libraries
from selenium import webdriver

# Set up the web driver
driver = webdriver.Chrome()

# Open the social media site
driver.get('https://example.com/login')

# Log in to the account
driver.find_element_by_name('username').send_keys('your_username')
driver.find_element_by_name('password').send_keys('your_password')
driver.find_element_by_name('login').click()

# Post a new status update
driver.find_element_by_name('status').send_keys('This is an automated post.')
driver.find_element_by_name('post').click()

# Close the web driver
driver.quit()