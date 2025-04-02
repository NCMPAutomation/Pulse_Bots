def manage_subscription(action, subscription_type):
    actions = {
        "upgrade": f"Your subscription has been upgraded to {subscription_type}.",
        "downgrade": f"Your subscription has been downgraded to {subscription_type}.",
        "cancel": "Your subscription has been cancelled."
    }
    return actions.get(action, "Invalid action.")

# Example usage
print(manage_subscription("upgrade", "Premium"))