import 'dart:io';
import 'recipe_lib.dart';
import 'shopping_list_lib.dart';


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