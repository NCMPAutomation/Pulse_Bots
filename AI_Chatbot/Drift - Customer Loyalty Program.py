def loyalty_program_info(customer_name):
    points = 150  # Example points
    rewards = ["10% off next purchase", "Free shipping"]
    return f"{customer_name}, you have {points} points. Available rewards: {', '.join(rewards)}."

# Example usage
print(loyalty_program_info("John Doe"))