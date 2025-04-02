def recommend_product(preferences):
    products = {
        "electronics": "Smartphone",
        "books": "Bestselling Novel",
        "clothing": "Designer Jacket"
    }
    return products.get(preferences, "No recommendation available")

# Example usage
print(recommend_product("electronics"))