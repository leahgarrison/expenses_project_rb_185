# Deleting Expenses
1. Allow users to delete specific expenses from the system.

```
$ ./expense list
  1 | 2016-04-05 |        14.56 | Pencils
  2 | 2016-04-05 |         3.29 | Coffee
  3 | 2016-04-05 |        49.99 | Text Editor
  4 | 2016-04-06 |         3.59 | Coffee
  5 | 2016-04-06 |        43.23 | Gas for Karen's Car
  
$ ./expense delete 5
The following expense has been deleted:
  5 | 2016-04-06 |        43.23 | Gas for Karen's Car
$ ./expense list
  1 | 2016-04-05 |        14.56 | Pencils
  2 | 2016-04-05 |         3.29 | Coffee
  3 | 2016-04-05 |        49.99 | Text Editor
  4 | 2016-04-06 |         3.59 | Coffee
```

2. If a user attempts to delete an expense that doesn't exist, an appropriate message should be displayed:

```
$ ./expense delete 5
There is no expense with the id '5'.
```


* Problem:
  * add functionality for a user to delete an expense item.
    * the commands displayed in help show that users can delete by the `id` number only.
    * `delete NUMBER - remove expense with id NUMBER` (from displayed help commands)
    * use a sql query to find the row with that id. 
      * if no row has that `id` value no rows will be returned.(so show the error)
      * if a row is found, pass the sql result to `display_expenses` - to show what row was deleted

  * if no item has that `id` then an error should be shown, specify what `id` value the user entered
* algorithm:
  * add another condition to the `run` method case statement to capture the `delete` string. 
  * set the second argument to a variable called `selected_id`
  * create a method called `delete_expense` in `ExpenseData` that takes a parameter called `_selected_id`
  * 