def customer_onboarding(customer_name):
    onboarding_steps = [
        "Step 1: Create your account.",
        "Step 2: Verify your email address.",
        "Step 3: Complete your profile.",
        "Step 4: Explore our features."
    ]
    return f"Welcome {customer_name}! Here are your onboarding steps:\n" + "\n".join(onboarding_steps)

# Example usage
print(customer_onboarding("John Doe"))