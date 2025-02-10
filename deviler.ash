void runDeviler() {
    // Initialize variables
    item candytype = $item[none];
    int max_amount = 0;

    // Iterate through all items in the game
    foreach it in $items[] {
        // Check if the item is a candy and if the amount in inventory is greater than the current max amount
        if (it.candy && item_amount(it) > max_amount) {
            candytype = it;
            max_amount = item_amount(it);
        }
    }

    // Print the candy with the highest amount in inventory
    if (candytype != $item[none]) {
        print("The candy you have the most of is: " + candytype + " with " + max_amount + " in inventory.", "green");
        
        // Use the candy with the "devilcandyegg" CLI command 3 times
        for i from 1 to 3 {
            cli_execute("devilcandyegg " + candytype);
        }
    } else {
        print("You do not have any candy in your inventory.", "red");
    }
}

runDeviler();