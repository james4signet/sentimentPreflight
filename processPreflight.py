# Sentiment Preprocess using BeautifulSoup

import openai_secret_manager
import requests
from bs4 import BeautifulSoup

# Get API key
try:
    secrets = openai_secret_manager.get_secret("google")
    api_key = secrets["api_key"]
except openai_secret_manager.ProvideError as e:
    print(e)
    exit()

# Prompt for website URL
url = input("Enter the website URL: ")

# Retrieve the website's HTML using requests
try:
    response = requests.get(url)
    response.raise_for_status()
    html = response.text
except requests.exceptions.RequestException as e:
    print(e)
    exit()

# Extract the text using BeautifulSoup
try:
    soup = BeautifulSoup(html, 'html.parser')
    text = soup.get_text()
except Exception as e:
    print(e)
    exit()

# Use the Google Cloud Natural Language API to analyze the text
data = {
    'document': {
        'type': 'PLAIN_TEXT',
        'content': text
    },
    'encoding_type': 'UTF8'
}

try:
    response = requests.post(
        f'https://language.googleapis.com/v1/documents:analyzeSentiment?key={api_key}',
        json=data
    )
    response.raise_for_status()
    # Get the sentiment score from the API response
    score = response.json()['documentSentiment']['score']
    # Print the sentiment score
    print("The sentiment of the website is:", score)
except requests.exceptions.RequestException as e:
    print(e)
    exit()



