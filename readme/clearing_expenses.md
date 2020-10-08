# Clearing Expenses

## Requirements

1. A user can remove all expenses from the system using a new command, `clear`.
2. Before deleting all expenses, the program should prompt the user to verify they wish to continue:

```sql 
$ ./expense clear
This will remove all expenses. Are you sure? (y/n)
```
 
3. If the user presses `n`, then the program should exit without deleting any data:
```
$ ./expense clear
This will remove all expenses. Are you sure? (y/n) # press n
$ ./expense list
1 | 2016-04-05 |        14.56 | Pencils
2 | 2016-04-05 |         3.29 | Coffee
3 | 2016-04-05 |        49.99 | Text Editor
4 | 2016-04-06 |         3.59 | Coffee

```

4. If the user presses y, all expenses should be deleted a message should be shown:

```
$ ./expense clear
This will remove all expenses. Are you sure? (y/n) # press y
All expenses have been deleted.
$ ./expense list
```

* Problem:
  * the `clear` command deletes all the expenses from the database table `expenses`
  * if the user types the `clear` command gets prompt confirming their choice
  * if the user responds with `y` then delete all the rows
  * if the user responds with `n` then the program should exist (abort) without deleting any data
  * implicit rules: make the `y/n` case insensitive. (if user enters a `Y` it'll be the same as `y`)
  
* algorithm:
  * add another clause to the `CLI` `run` method for the `clear` command.
    * prompt the user with a confirmation to delete all- 
    * save the prompt response as `response`
    * If the response is `Y` or `y`, call the `delete_all_expenses` method
    * If the response is `N` or `n` abort (end any commands)
  * add a method to `ExpenseData` called `delete_all_expenses`
    * save a SQl statement to a variable called `sql`
     * have it delete all rows from `expenses`
    * execute that statement via PG
    * output a response to the user, saying `all expenenses have been deleted`