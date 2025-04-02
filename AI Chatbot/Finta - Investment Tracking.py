import requests

def track_investments(api_url, api_key):
    response = requests.get(api_url, headers={"Authorization": f"Bearer {api_key}"})
    investments = response.json()
    return investments

# Example usage
api_url = "https://api.investment.com/portfolio"
api_key = "your_api_key"
print(track_investments(api_url, api_key))