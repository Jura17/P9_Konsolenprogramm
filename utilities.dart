import 'dart:io';

Map chickenWings = {
  "title" : "Sesame Chicken Wings",
  "difficulty" : "Not too tricky",
  "preptime" : "40 min",
  "directions" : 
  ["Place the eggs, salt and pepper in a bowl. Stir to combine", 
  "Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.", 
  "Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.", 
  "Heat 3 inches of oil in a deep pan to 350 degrees F", "Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken", 
  "Drain the chicken on paper towels", "While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl."],
  "ingredients" : 
  ["1 1/2 lbs chicken breast", "2 eggs beaten", "salt and papper to taste", "1/2 cup all purpose flour", "1/2 cup cornstarch", "oil for frying", "1 teaspoon vegetable oil", "1 teaspoon minced fresh garlic", 
  "1/4 cup honey", "1/4 cup soy sauce (reduced sodium if possible)", "2 tablespoons ketchup", "3 tablespoons brown sugar", "2 tablespoons rice vinegar", "1 tablespoon toasted sesame oil", "2 teaspoons cornstarch", 
  "2 tablespoons sesame seeds", "2 tablespoons sliced green onions"]
  };

Map shiitakeStirFry = {
  "title" : "Shiitake Stir-fry",
  "difficulty" : "Not too tricky",
  "preptime" : "40 min",
  "directions" : 
  ["Combine soy sauce, oyster sauce, rice vinegar, sweet Thai chili sauce, maple syrup, and red pepper chili flakes in a small bowl. Stir until smooth and set aside.", 
  "Add mushrooms to a bowl, drizzle with 1 tablespoon soy sauce, and toss until coated. Sprinkle cornstarch over mushrooms and toss until completely coated.", 
  "Heat 1 tablespoon sesame oil in a wok or large skillet over medium-high heat. Add mushrooms; cook until golden brown, about 5 minutes per side. Transfer mushrooms into a dish; set aside.", 
  "Heat 3 inches of oil in a deep pan to 350 degrees F", "Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken", 
  "Heat remaining 1 tablespoon sesame oil in the same wok or skillet over medium-high heat. Add onions, orange peppers, and zucchini, and cook until softened, about 5 minutes. Stir sauce into pan and cook until thickened, about 3 minutes. Add mushrooms back into stir fry; toss to coat."],
  "ingredients" : 
  ["2 tablespoons low-sodium soy sauce", "1 1/2 teaspoons oyster sauce", "1 tablespoon rice vinegar", "1 tablespoon sweet Thai chili sauce", "1 tablespoon maple syrup", "1/8 teaspoon red chili pepper flakes", 
  "6 ounces shiitake mushrooms, thinly sliced", "1 tablespoon low-sodium soy sauce", "2 tablespoons cornstarch", "2 tablespoons sesame oil, divided", "2 cloves garlic, minced", 
  "1/2 cup chopped onion", "1 orange bell pepper, chopped", "1/2 cup chopped zucchini"]
  };

Map easyTikTokPizza = {
  "title" : "Easy-TikTok-Pizza",
  "difficulty" : "Easy",
  "preptime" : "37 min",
  "directions" : 
  ["Gather all ingredients. Preheat the oven to 400 degrees F (200 degrees C) with a rack in the center position. Lightly oil a 13- by 18-inch rimmed baking sheet.", 
  "Thinly slice tomatoes and place them on a paper towel-lined plate. Pat the tops of the tomatoes dry.", 
  "Gently stretch and press pizza dough to each corner of the rimmed baking sheet. Drizzle with oil, then season all over with salt, pepper, and oregano (or Italian seasoning).", 
  "Cover the pizza dough with sliced tomatoes (they should touch). Bake pizza until the crust is golden brown and the tomatoes look roasted, 22 to 25 minutes.", 
  "Let cool slightly, then transfer to a cutting board and cut into small squares. Sprinkle with a pinch of salt and garnish with fresh basil."],
  "ingredients" : 
  ["1 pound store-bought pizza dough, brought to room temperature", "4 plum or Roma tomatoes, thinly sliced", 
  "fresh basil for garnishing, torn or roughly sliced", "olive oil", "salt", "freshly ground black pepper", "dried oregano (or Italian seasoning)"]
};

List<Map> allRecipes = [chickenWings, shiitakeStirFry, easyTikTokPizza];
List<String>shoppingList = ["bin bags", "paper towels", "flour", "dish soap"];

List<String> createList({int counterStart = 1}) {
  List<String> userInput = [];
  int stepCounter = counterStart;

  while(true) {
    stdout.write("$stepCounter. ");
    String stepInput = stdin.readLineSync()!;
    if(stepInput.toLowerCase() == "x") {
      return userInput;
    } else {
      userInput.add(stepInput);
      stepCounter++;
    }
  }
}


