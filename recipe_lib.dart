import 'dart:io';
import 'dart:math';
import 'utilities.dart';


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
  if(allRecipes[recipeIndex]["directions"].isEmpty) {
    print("No cooking directions available.");
  } else {
    for (var i = 0; i < allRecipes[recipeIndex]["directions"].length; i++) {
      print("${i + 1}. ${allRecipes[recipeIndex]["directions"][i]}");
    }
  }
  print("\nIngredients:");
  if(allRecipes[recipeIndex]["ingredients"].isEmpty) {
    print("No ingredient list available.");
  } else {
    for (var i = 0; i < allRecipes[recipeIndex]["ingredients"].length; i++) {
      print("${i + 1}. ${allRecipes[recipeIndex]["ingredients"][i]}");
    }
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

void recipeRandomizer() {
  Random random = new Random();
  int randomNum = random.nextInt(allRecipes.length);
  showRecipeDetails(randomNum);
}