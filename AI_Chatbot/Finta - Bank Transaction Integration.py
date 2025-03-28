import requests

def fetch_transactions(api_url, api_key):
    response = requests.get(api_url, headers={"Authorization": f"Bearer {api_key}"})
    transactions = response.json()
    return transactions

# Example usage
api_url = "https://api.bank.com/transactions"
api_key = "your_api_key"
print(fetch_transactions(api_url, api_key))