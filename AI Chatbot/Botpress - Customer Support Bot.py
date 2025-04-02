import json

# Function to fetch FAQ or process customer queries
def handle_customer_query(issue_type, product=None, order_id=None):
    """
    Handles customer queries based on the issue type.
    Args:
        issue_type (str): Type of issue (e.g., 'FAQ', 'Order Tracking').
        product (str, optional): Product name for troubleshooting.
        order_id (str, optional): Order ID for tracking.
    
    Returns:
        str: Response to the customer query.
    """
    if issue_type == "FAQ":
        # Mock FAQ response
        faq_response = """
        Here are some frequently asked questions:
        1. How do I reset my password? -> Go to the login page and click 'Forgot Password'.
        2. What is the return policy? -> Items can be returned within 30 days of purchase.
        """
        return faq_response

    elif issue_type == "Order Tracking":
        # Mock order tracking response
        if order_id:
            tracking_response = f"Your order {order_id} is currently out for delivery and will arrive by 5 PM today."
        else:
            tracking_response = "Please provide your order ID to track your order."
        return tracking_response

    elif issue_type == "Troubleshooting":
        # Mock troubleshooting response
        if product:
            troubleshooting_response = f"For {product}, please ensure it is plugged in and powered on. Refer to the product manual for detailed steps."
        else:
            troubleshooting_response = "Please specify the product for troubleshooting assistance."
        return troubleshooting_response

    else:
        return "I'm sorry, I couldn't understand your query. Could you please rephrase or specify further?"

# Example chatbot interaction
if __name__ == "__main__":
    # Simulate user queries
    print("Customer Support Example:")
    
    # Example: FAQ query
    response_faq = handle_customer_query(issue_type="FAQ")
    print(response_faq)
    
    # Example: Order Tracking query
    response_tracking = handle_customer_query(issue_type="Order Tracking", order_id="ORD123456")
    print(response_tracking)
    
    # Example: Troubleshooting query
    response_troubleshooting = handle_customer_query(issue_type="Troubleshooting", product="Smart Speaker")
    print(response_troubleshooting)