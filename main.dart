import 'dart:io';

void main(List<String> args) {
  bool runProgram = true;

  while(runProgram) {
    print("\n-------- MAIN MENU --------");
    print("What do you want to do?");
    print("1 Cookbook");
    print("2 Recommend Me Something");
    print("3 Shopping List");
    print("4 End program\n");

    String? userInput = stdin.readLineSync();
    print("");

    if(userInput != null) {
      switch (userInput) {
        case "1":
          recipeSubMenu();
        case "2":  
          recommendationsSubMenu();
        case "3":
          shoppingListSubMenu();
        case "4":
          print("Terminating program...\n");  
          runProgram = false;
        default:
          print("Invalid input, please try again.");
      }
    }
  }
}

void recipeSubMenu() {
  bool showRecipeSubMenu = true;

  while(showRecipeSubMenu) {
    print("\n-------- RECIPE SUBMENU --------");
    print("What do you want to do?");
    print("1 Show all recipes");
    print("2 Add a recipe");
    print("3 Delete recipe");
    print("4 Go back to main menu\n");

    String? userInput = stdin.readLineSync();
    print("");

    if(userInput != null) {
      switch (userInput) {
        case "1":
          print("Showing all recipes...");
        case "2":  
          print("Prompting user add info about a recipe...");
        case "3":
          print("Showing a list of recipe titles to choose from for deletion...");
        case "4":
          print("Terminating function call...\n");  
          showRecipeSubMenu = false;
        default:
          print("Invalid input, please try again.");
      }
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
    bool showShoppingListSubMenu = true;

  while(showShoppingListSubMenu) {
    print("\n-------- SHOPPING LIST SUBMENU --------");
    print("What do you want to do?");
    print("1 Show all shopping list items");
    print("2 Add a item");
    print("3 Delete item");
    print("4 Go back to main menu\n");

    String? userInput = stdin.readLineSync();
    print("");

    if(userInput != null) {
      switch (userInput) {
        case "1":
          print("Showing all shopping list items...");
        case "2":  
          print("Prompting user to add item...");
        case "3":
          print("Showing a list of items to choose from for deletion...");
        case "4":
          print("Terminating function call...\n");  
          showShoppingListSubMenu = false;
        default:
          print("Invalid input, please try again.");
      }
    }
  }
}