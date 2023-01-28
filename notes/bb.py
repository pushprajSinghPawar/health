import requests

app_id = "bfb0e9fd"
app_key = "4f605cd07620928fc70e487900796e71"

food_name = "Big Mac"

headers = {
    "Content-Type": "application/json",
    "x-app-id": app_id,
    "x-app-key": app_key
}

# serving_weight = response.json()['foods'][0]['serving_weight_grams']
# calories = response.json()['foods'][0]['nf_calories']
# calories_per_100g = (calories * 100) / serving_weight

food_names = ['milk', 'meat', 'burger', 'chapati', 'chut', 'rice', 'rice curry', 'masala dosa', 'onion rings', ]
for food_name in food_names:
    data = {
        "query": food_name,
    }
    
    response = requests.post("https://trackapi.nutritionix.com/v2/natural/nutrients", headers=headers, json=data)
    
    if response.status_code == 200:
        response_data = response.json()
        # print(response_data)
        nutrients = response_data['foods'][0]
        nutrient_data = {
            'food name ':nutrients['food_name'],
            'calories': float(nutrients['nf_calories']),
            'fat': float(nutrients['nf_total_fat']),
            'protein': str(nutrients['nf_protein']),
            'carbohydrates': str(nutrients['nf_total_carbohydrate']),
            'sugar': str(nutrients['nf_sugars']),
            'servings': int(nutrients['serving_weight_grams']),
        }
        
        print(nutrient_data)
        nutrient_data['calories'] = nutrient_data['calories']*100 / nutrient_data['servings']
        nutrient_data['servings'] = 100
        print(nutrient_data)
        
    else:
        print(response.status_code)
        print(response.content)
