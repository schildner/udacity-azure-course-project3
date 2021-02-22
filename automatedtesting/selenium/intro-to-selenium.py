# #!/usr/bin/env python
from selenium import webdriver

# Start the browser and navigate to http://automationpractice.com/index.php.
driver = webdriver.Chrome()

url = 'http://automationpractice.com/index.php'
search_item = 'dress'

print('Navigating to ' + url)
driver.get(url)

print('Searching for ' + search_item)
driver.find_element_by_css_selector("input[id='search_query_top']").send_keys(search_item)
driver.find_element_by_css_selector("button[class='btn btn-default button-search']").click()

our_search = driver.find_element_by_css_selector("div[id='center_column'] > h1 > span.lighter").text
results = driver.find_element_by_css_selector("div[id='center_column'] > h1 > span.heading_counter").text

assert "DRESS" in our_search
print("We are on the search results page for " + our_search)

if '7' in results:
    print("We found 7 results successfully!")
else: 
    print("ERROR! We did not find 7 results!")