import requests
import json
class Fooditem(object):
    def __init__(self, cals=0 , name = "",sugar = 0, protein = 0, fats = 0, carb= 0, fiber = 0, cholestrol = 0, serving = 0) -> None:
        self.calories = cals
        self.fooditem = name
        self.protein_content = protein
        self.carbohydradate_content = carb
        self.sugar_content = sugar
        self.fiber_mass = fiber
        self.cholestrol_amount = cholestrol
        self.serving_weight = serving

    def __str__(self):
        return f'------------------------------- \n{self.fooditem} details \n {self.calories} calories \n {self.protein_content}g protein \n {self.carbohydradate_content}g carbohydrates \n {self.sugar_content}g sugar \n {self.fiber_mass}g fiber \n {self.cholestrol_amount}mg cholesterol \n {self.serving_weight}g serving size \n'

    
food_name = "Big Mac"


headers={'X-Api-Key': 'o0SDOwQIQeyghG1B2n0tRFfNRLCqL6u65yWdrMzx' }
data = "50 gram of milk"

response = requests.get("https://api.api-ninjas.com/v1/nutrition?query="+data, headers=headers)
a=[]
if response.status_code == 200:
    # do something with the response
    li = json.loads(response.text)
    for data in li:
        print(data)
        print('----------------------------------------')
        a.append(Fooditem(data['calories'],data['name'], data['sugar_g'], data['protein_g'],data['fat_total_g'], data['carbohydrates_total_g'], data['fiber_g'], data['cholesterol_mg'], data['serving_size_g']))
else:
    print("Error:", response.status_code)

for i in a:
    print(i)