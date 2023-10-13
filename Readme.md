# Recipes App

This is a Recipes Demo App, I did it using SwiftUI because I think I like it more than UIKit.
The app only have two endpoints and some structures to decode the responses, I tried to follow the best practices, any feedback is well received.

## Get Foods
Endpoint
```
http://demo5047648.mockable.io/GetFoods
```
* ### Get Foods Response

```Json
{
  "foods": [
    {
      "id": 1,
      "name": "Pizza",
      "ingredients": ["Dough", "Tomato Sauce", "Cheese", "Pepperoni"],
      "urlImage": "https://cdn-icons-png.flaticon.com/128/3578/3578614.png"
    }
  ]
}
```
## Get Recipes
Endpoint
```
http://demo5047648.mockable.io/GetRecipe?id=Int
```

* ### Get Recipes Response

```Json
{
  "name": "Pizza",
  "urlImage": "https://www.themealdb.com/images/media/meals/va668f1683209318.jpg",
  "ingredients": [
    {
      "name": "Dough",
      "measure": "1 packet"
    }
  ],
  "location": {
    "name": "Grocery Store",
    "address": "123 Main St, City, State",
    "latitude": "37.7749",
    "longitude": "-122.4194"
  },
  "procedure": [
    "1. Preheat the oven to 475°F (245°C).",
    "2. Roll out the dough into a round shape."
    ]
}

```

## Architecture and Design Patterns

I decided to do an MVVM because i think it's the most common used with VIPER. I separated all the views in to different Files so i can modify wach component without affect the complete View, I have two Screens:

* ### HomeView
    In this screen I have a **ListView** where i show all the images and names in cells, a search bar to search ingredients or name of the foods.

* ### RecipeView
    In this Screen i have a **TabView**:
    *   **ProcedureView**
        * Another single list displaying my procedure list
    *   **IngredientsView**
        * Another list displaying the Ingredients with the Measures
    *   **MapView**
        * A simple map using MapKit where I display the coordinates that I get from my recipe endpoint.
* ### UseCases
    I added two UseCases, one to get the recipes and one for the foods, this helps me to only have one instance from my API and I can change the function of it here and not in the ViewModel.

## Network
I added two API's, one for my recipes and one for my foods, in the case that I don't get a response, the app load the sample data, this work for the errors but this could be used to create a mocks Environment to make Instrumental Testing using a tool like Waldo.
