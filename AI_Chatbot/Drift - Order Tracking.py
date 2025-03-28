def track_order(order_id):
    tracking_info = {
        "status": "In Transit",
        "expected_delivery": "2025-04-05"
    }
    return f"Order {order_id} is currently {tracking_info['status']}. Expected delivery: {tracking_info['expected_delivery']}."

# Example usage
print(track_order("12345"))