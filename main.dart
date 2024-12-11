import 'dart:io';


Map chickenWings = {
    "title" : "Sesame Chicken Wings",
    "difficulty" : "Not too tricky",
    "preptime" : "40 min",
    "directions" : "\n1. Place the eggs, salt and pepper in a bowl. Stir to combine\n2. Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.\n3. Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.\n4. Heat 3 inches of oil in a deep pan to 350 degrees F\n5. Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken\n6. Drain the chicken on paper towels\n7. While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl.",
  };

  Map shiitakeStirFry = {
    "title" : "Shiitake Stir-fry",
    "difficulty" : "Not too tricky",
    "preptime" : "40 min",
    "directions" : "\n1. Place the eggs, salt and pepper in a bowl. Stir to combine\n2. Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.\n3. Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.\n4. Heat 3 inches of oil in a deep pan to 350 degrees F\n5. Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken\n6. Drain the chicken on paper towels\n7. While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl.",
  };

  Map threeIngredientPizza = {
    "title" : "3-Ingredient-Pizza",
    "difficulty" : "Not too tricky",
    "preptime" : "40 min",
    "directions" : "\n1. Place the eggs, salt and pepper in a bowl. Stir to combine\n2. Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.\n3. Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.\n4. Heat 3 inches of oil in a deep pan to 350 degrees F\n5. Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken\n6. Drain the chicken on paper towels\n7. While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl.",
  };

  List<Map> allRecipes = [chickenWings, shiitakeStirFry, threeIngredientPizza];
  // List<Map> favoriteRecipes = [shiitakeStirFry, threeIngredientPizza];

void main(List<String> args) {
  bool isRunningProgram = true;

  while(isRunningProgram) {
    print("\n-------- MAIN MENU --------");
    print("[1] Cookbook");
    print("[2] Recommend Me Something");
    print("[3] Shopping List");
    print("[x] End program\n");
    stdout.write("Please select an option: ");

    String userInput = stdin.readLineSync()!;
    switch (userInput) {
      case "1":
        recipeSubMenu();
      case "2":  
        recommendationsSubMenu();
      case "3":
        shoppingListSubMenu();
      case "x":
        print("Terminating program...\n");  
        isRunningProgram = false;
      default:
        print("Invalid input, please try again.");
    }
    
  }
}

void recipeSubMenu() {
  bool isShowingRecipeSubMenu = true;

  while(isShowingRecipeSubMenu) {
    print("\n-------- RECIPE SUBMENU --------");
    print("[1] Show all recipes");
    print("[2] Add a recipe");
    print("[3] Delete recipe");
    print("[x] Go back to main menu\n");
    stdout.write("Please select an option: ");

    String userInput = stdin.readLineSync()!;
    switch (userInput) {
      case "1":
        showAllRecipes(allRecipes);
      case "2":  
        print("Prompting user add info about a recipe...");
      case "3":
        print("Showing a list of recipe titles to choose from for deletion...");
      case "x":
        print("Terminating function call...\n");  
        isShowingRecipeSubMenu = false;
      default:
        print("Invalid input, please try again.");
    }
    
  }
}

void recommendationsSubMenu() {
  print("\n-------- RECOMMENDATIONS --------");
  print("Asking user several questions...");
  print("...");
  print("Showing recommendation...");
}

void shoppingListSubMenu() {
  bool isShowingShoppingListSubMenu = true;

  while(isShowingShoppingListSubMenu) {
    print("\n-------- SHOPPING LIST SUBMENU --------");
    print("[1] Show all shopping list items");
    print("[2] Add a item");
    print("[3] Delete item");
    print("[x] Go back to main menu\n");
    stdout.write("Please select an option: ");

    String userInput = stdin.readLineSync()!;
    switch (userInput) {
      case "1":
        print("Showing all shopping list items...");
      case "2":  
        print("Prompting user to add item...");
      case "3":
        print("Showing a list of items to choose from for deletion...");
      case "x":
        print("Terminating function call...\n");  
        isShowingShoppingListSubMenu = false;
      default:
        print("Invalid input, please try again.");
    }
    
  }
}

void showAllRecipes(List<Map>recipeList) {
  bool isShowingAllRecipes = true;

  while(isShowingAllRecipes) {
    print("=========================");
    for (var i = 0; i < recipeList.length; i++) {
      print("${[i+1]} ${recipeList[i]["title"]}");
    }
    print("[x] Go back to recipe submenu\n");

    stdout.write("Please select a recipe: ");
    String userInput = stdin.readLineSync()!;

    if(userInput.toLowerCase() == 'x') {
      isShowingAllRecipes = false;
    }
    int? userInputAsInt = int.tryParse(userInput);

    // War Umwandlung von string zu integer erfolgreich? --> ziehe 1 vom input ab, um zur Zählweise 0...i zurückzukommen
    if(userInputAsInt != null) {
      userInputAsInt--;

      if(userInputAsInt >= 0 && userInputAsInt < recipeList.length) {
        showRecipeDetails(recipeList[userInputAsInt]);
      } else {
        print("Invalid input, please try again.");
      } 
    }
  }
}

void showRecipeDetails(Map recipe) {
    print("=========================");
    print("Title: ${recipe["title"]}");
    print("Difficulty: ${recipe["difficulty"]}");
    print("Prep time: ${recipe["preptime"]}");
    print("Directions: ${recipe["directions"]}");
    print("=========================");
}
