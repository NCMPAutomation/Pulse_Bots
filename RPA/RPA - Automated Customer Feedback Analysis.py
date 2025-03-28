# Import necessary libraries
import pandas as pd
from textblob import TextBlob

# Load the customer feedback data
feedback_data = pd.read_csv('feedback.csv')

# Analyze the sentiment of each feedback
feedback_data['sentiment'] = feedback_data['feedback'].apply(lambda x: TextBlob(x).sentiment.polarity)

# Save the analyzed feedback to a new CSV file
feedback_data.to_csv('analyzed_feedback.csv', index=False)