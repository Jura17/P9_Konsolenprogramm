import 'dart:io';
import 'utilities.dart';

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