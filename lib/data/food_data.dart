import 'package:restofood/model/food_model.dart';

class FoodData {
  static List<Food> getFoods(){
    var _foods = new List<Food>();

    _foods.add(Food(
      name: "Ayam Bakar",
      description: "Ayam bakar pedas super mantap",
      price: 15000,
      image: "food-1.png"
    ) 
    );

    _foods.add(Food(
      name: "Sate Ayam",
      description: "Sate ayam bumbu kacang",
      price: 15000,
      image: "food-2.png"
    ) 
    );

    _foods.add(Food(
      name: "Jus jeruk",
      description: "Jus jeruk",
      price: 10000,
      image: "drink-1.png"
    ) 
    );

    _foods.add(Food(
      name: "Jus Mangga",
      description: "Jus Mangga",
      price: 10000,
      image: "drink-2.png"
    ) 
    );

    return _foods;
  }
}