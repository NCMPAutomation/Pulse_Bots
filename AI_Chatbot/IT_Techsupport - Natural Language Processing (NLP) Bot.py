# Importing required libraries
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Example issues and responses
issues = [
    "How to reset password?",
    "WiFi not working.",
    "Computer is running slow.",
    "Cannot install software.",
    "Printer not connecting."
]

responses = [
    "Use the 'Forgot Password' option on the login page.",
    "Try restarting the router. If it doesn't work, check your ISP's status.",
    "Clear cache, delete unwanted files, or upgrade your RAM.",
    "Ensure your system meets the requirements and try reinstalling.",
    "Ensure the printer is powered on, connected, and has sufficient paper and ink."
]

# Function for the NLP chatbot
def nlp_bot():
    print("Welcome to the IT NLP Support Bot!")
    vectorizer = CountVectorizer().fit_transform(issues)
    vectors = vectorizer.toarray()
    while True:
        user_input = input("Describe your issue (type 'exit' to quit): ").strip()
        if user_input.lower() == "exit":
            print("Thank you for using the IT NLP Support Bot. Goodbye!")
            break
        user_vector = vectorizer.transform([user_input]).toarray()
        similarity = cosine_similarity(user_vector, vectors)
        closest_match = similarity.argmax()
        print(responses[closest_match] if similarity.max() > 0 else "I'm not sure about this issue.")

# Start chatbot
nlp_bot()