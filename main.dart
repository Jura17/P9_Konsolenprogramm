import 'dart:io';
import 'dart:math';

Map chickenWings = {
    "title" : "Sesame Chicken Wings",
    "difficulty" : "Not too tricky",
    "preptime" : "40 min",
    "directions" : ["Place the eggs, salt and pepper in a bowl. Stir to combine", "Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.", "Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.", "Heat 3 inches of oil in a deep pan to 350 degrees F", "Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken", "Drain the chicken on paper towels", "While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl."],
    "ingredients" : ["1 1/2 lbs chicken breast", "2 eggs beaten", "salt and papper to taste", "1/2 cup all purpose flour", "1/2 cup cornstarch", "oil for frying"]
  };

  Map shiitakeStirFry = {
    "title" : "Shiitake Stir-fry",
    "difficulty" : "Not too tricky",
    "preptime" : "40 min",
    "directions" : ["Place the eggs, salt and pepper in a bowl. Stir to combine", "Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.", "Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.", "Heat 3 inches of oil in a deep pan to 350 degrees F", "Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken", "Drain the chicken on paper towels", "While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl."],
    "ingredients" : ["1 1/2 lbs chicken breast", "2 eggs beaten", "salt and papper to taste", "1/2 cup all purpose flour", "1/2 cup cornstarch", "oil for frying"]
  };

  Map threeIngredientPizza = {
    "title" : "3-Ingredient-Pizza",
    "difficulty" : "Not too tricky",
    "preptime" : "40 min",
    "directions" : ["Place the eggs, salt and pepper in a bowl. Stir to combine", "Place the flour and 1/2 cup of cornstarch in a shallow bowl or on a plate. Stir to combine.", "Dip each piece of chicken into the egg mixture, then into the flour. Repeat the process with all of the chicken.", "Heat 3 inches of oil in a deep pan to 350 degrees F", "Add 7-8 pieces of chicken to the pan. Cook for 5 minutes or until crispy and golden brown. Repeat the process with the remaining chicken", "Drain the chicken on paper towels", "While the chicken is cooking, combine the honey, soy sauce, ketchup, brown sugar, rice vinegar, sesame oil and 2 teaspoons of cornstarch in a bowl."],
    "ingredients" : ["1 1/2 lbs chicken breast", "2 eggs beaten", "salt and papper to taste", "1/2 cup all purpose flour", "1/2 cup cornstarch", "oil for frying"]
  };

  List<Map> allRecipes = [chickenWings, shiitakeStirFry, threeIngredientPizza];
  List<String>shoppingList = ["bin bags", "paper towels", "flour", "dish soap"];

void main(List<String> args) {
  while(true) {
    print("\n======== MAIN MENU ========");
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
        print("\nHow about this recipe for today?");
        recipeRandomizer();
      case "3":
        shoppingListSubMenu();
      case "x":
        print("Terminating program...\n");  
        return;
      default:
        print("Invalid input, please try again.");
    }
  }
}

void recipeSubMenu() {
  while(true) {
    print("\n======== RECIPE SUBMENU ========");
    print("[1] Recipe overview");
    print("[2] Add a recipe");
    print("[3] Delete recipe");
    print("[x] Go back to main menu\n");
    stdout.write("Please select an option: ");

    String userInput = stdin.readLineSync()!;
    switch (userInput) {
      case "1":
        showAllRecipes();
        if(allRecipes.isNotEmpty) showRecipeDetailsMenu();
      case "2":  
        addRecipe();
      case "3":
        deleteRecipe();
      case "x":
        print("Terminating function call...\n");  
        return;
      default:
        print("Invalid input, please try again.");
    }
  }
}

void recommendationsSubMenu() {
  print("\n======== RECOMMENDATIONS ========");
  print("Asking user several questions...");
  print("...");
  print("Showing recommendation...");
}

void shoppingListSubMenu() {
  while(true) {
    print("\n======== SHOPPING LIST SUBMENU ========");
    print("[1] Show shopping list");
    print("[2] Add item");
    print("[3] Delete item");
    print("[x] Go back to main menu\n");
    stdout.write("Please select an option: ");

    String userInput = stdin.readLineSync()!;
    switch (userInput) {
      case "1":
        showShoppingList();
      case "2":  
        addToShoppingList();
      case "3":
        deleteFromShoppingList();
      case "x":
        print("Terminating function call...\n");  
        return;
      default:
        print("Invalid input, please try again.");
    }
    
  }
}

void showAllRecipes() {
  if(allRecipes.isEmpty) {
    print("There are no recipes in your cookbook. Go and add some!");
  } else {
    print("\n======== YOUR RECIPES ========");
    for (var i = 0; i < allRecipes.length; i++) {
      print("${[i+1]} ${allRecipes[i]["title"]}");
    }
  }
}

void showRecipeDetailsMenu() {
  while(true) {
    print("[x] Go back to recipe submenu\n");

    stdout.write("Please select a recipe: ");
    String userInput = stdin.readLineSync()!;

    if(userInput.toLowerCase() == 'x') {
      return;
    }
    int? recipeIndex = int.tryParse(userInput);

    // War Umwandlung von string zu integer erfolgreich? --> ziehe 1 vom input ab, um zur Zählweise 0...i zurückzukommen
    if(recipeIndex != null && recipeIndex - 1 >= 0 && recipeIndex - 1 < allRecipes.length) {
      recipeIndex--;
      showRecipeDetails(recipeIndex);
    } else {
      print("Invalid input, please try again.");
    } 
    showAllRecipes();
  }
}

void showRecipeDetails(int recipeIndex) {
  print("-------------------------");
  print("Title: ${allRecipes[recipeIndex]["title"]}");
  print("Difficulty: ${allRecipes[recipeIndex]["difficulty"]}");
  print("Prep time: ${allRecipes[recipeIndex]["preptime"]}");
  print("\nDirections:");
  for (var i = 0; i < allRecipes[recipeIndex]["directions"].length; i++) {
    print("${i + 1}. ${allRecipes[recipeIndex]["directions"][i]}");
  }
  print("\nIngredients:");
  for (var i = 0; i < allRecipes[recipeIndex]["ingredients"].length; i++) {
    print("${i + 1}. ${allRecipes[recipeIndex]["ingredients"][i]}");
  }
}

// Fragt den Nutzer nach einem Titel, Schwierigkeitsgrad, Zubereitungszeit insgesamt und nach einzelnen Zubereitungsschritten
// Daten werden in einer Map gespeichert
// Fertige Map wird am Ende allRecipes list hinzugefügt 
void addRecipe() {
  print("\n======== ADD RECIPE ========");
  print("Please enter the following infos about your recipe.");
  stdout.write("Title: ");
  String titleInput = stdin.readLineSync()!;
  stdout.write("Difficulty: ");
  String difficultyInput = stdin.readLineSync()!;
  stdout.write("Prep time in total: ");
  String prepTimeInput = stdin.readLineSync()!;
  print("\nDirections (enter x when you're done): ");
  List<String> directionsInput = createList();
  print("\nIngredients (enter x when you're done): ");
  List<String> ingredientsInput = createList();

  Map<String, dynamic> newRecipe = {
    "title" : titleInput,
    "difficulty" : difficultyInput,
    "preptime" : prepTimeInput,
    "directions" : directionsInput,
    "ingredients" : ingredientsInput
  };
  allRecipes.add(newRecipe);
  print("\n==> $titleInput was added to your recipe list");
}

void deleteRecipe() {
  if(allRecipes.isEmpty) {
    print("There are no recipes in your cookbook. Go and add some!");
  } else {
    while(true) {
      showAllRecipes();
      print("[x] Go back to recipe submenu\n");

      stdout.write("Please select the recipe you want to delete: ");
      String userInput = stdin.readLineSync()!;

      if(userInput.toLowerCase() == 'x') {
        return;
      }
      int? recipeIndex = int.tryParse(userInput);

      // War Umwandlung von string zu integer erfolgreich? --> ziehe 1 vom input ab, um zur Zählweise 0...i zurückzukommen
      if(recipeIndex != null && recipeIndex - 1 >= 0 && recipeIndex - 1 < allRecipes.length) {
        recipeIndex--;
        
        String recipeName = allRecipes[recipeIndex]["title"];
        allRecipes.removeAt(recipeIndex);
        print("\n==> $recipeName was removed from recipes.");
        if(allRecipes.isEmpty) {
          print("\nThere are no recipes left in your cookbook.");
          return;
        }
      } else {
        print("Invalid input, please try again.");
      } 
    }
  }
}

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

void showShoppingList() {
  if(shoppingList.isEmpty) {
    print("There is nothing on the shopping list. Go and add something!");
  } else {
    int itemCounter = 1;
    print("\n======== SHOPPING LIST ========");
    for (String item in shoppingList) {
        print("[$itemCounter] ${item}");
        itemCounter++;
    }
  }
}

void addToShoppingList() {
  showShoppingList();
  List<String> tempList = createList(counterStart: shoppingList.length + 1);
  for (var item in tempList) {
    shoppingList.add(item);
  }
}

void deleteFromShoppingList() {
  while(true) {
    showShoppingList();
    print("[x] Go back to shopping list submenu\n");

    stdout.write("Please select the item you want to delete: ");
    String userInput = stdin.readLineSync()!;

    if(userInput.toLowerCase() == 'x') {
      return;
    }
    int? shoppingItemIndex = int.tryParse(userInput);

    // War Umwandlung von string zu integer erfolgreich? --> ziehe 1 vom input ab, um zur Zählweise 0...i zurückzukommen
    if(shoppingItemIndex != null && shoppingItemIndex - 1 >= 0 && shoppingItemIndex - 1 < shoppingList.length) {
      shoppingItemIndex--;
      String itemName = shoppingList[shoppingItemIndex];
      shoppingList.removeAt(shoppingItemIndex);
      print("\n==> $itemName was removed from shopping list");
      if(shoppingList.isEmpty) {
        print("\nThere is nothing on the shopping list anymore.");
        return;
      }
    } else {
      print("Invalid input, please try again.");
    } 
  }
}

void recipeRandomizer() {
  Random random = new Random();
  int randomNum = random.nextInt(allRecipes.length);
  showRecipeDetails(randomNum);
}
