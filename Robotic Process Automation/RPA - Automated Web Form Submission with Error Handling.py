# Import necessary libraries
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException

# Set up the web driver
driver = webdriver.Chrome()

try:
    # Open the web form
    driver.get('https://example.com/form')

    # Fill in the form fields
    driver.find_element_by_name('name').send_keys('John Doe')
    driver.find_element_by_name('email').send_keys('john.doe@example.com')
    driver.find_element_by_name('submit').click()

except NoSuchElementException as e:
    # Handle the error (e.g., element not found)
    print(f'Error: {e}')

finally:
    # Close the web driver
    driver.quit()