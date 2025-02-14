void runDeviler() {
    // Initialize variables
    item candytype = $item[none];
    int max_amount = 0;
    boolean haveDeviler = item_amount($item[candy egg deviler]) > 0;
    boolean Devilerexists = available_amount($item[candy egg deviler]) > 0;
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
        if (haveDeviler) {
            for (int i = 1; i <= 3; i++) {
                cli_execute("devilcandyegg " + candytype);
            }
        } else {
            if (Devilerexists) {
                print("You have a Candy Egg Deviler, but it is not in your inventory.  Please move it to your inventory to use this script.", "blue");
            } else {
                print("You do not have a Candy Egg Deviler in your inventory.", "red");
            }
        }
    } else {
        print("You do not have any candy in your inventory.", "red");
    }
}

runDeviler();
