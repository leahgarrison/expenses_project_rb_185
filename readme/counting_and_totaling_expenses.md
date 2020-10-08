# Requirements

1. The list command should display a count of expenses in addition to the total of all expenses:

```
$ ./expense list
There are 4 expenses.
  1 | 2016-04-07 |        14.56 | Pencils
  2 | 2016-04-07 |         3.29 | Coffee
  3 | 2016-04-07 |        49.99 | Text Editor
  4 | 2016-04-07 |         3.59 | More Coffee
--------------------------------------------------
Total                     71.43
```

2. Additionally, if there are no expenses 
(which is much more possible now that we've implemented the `clear` command), an appropriate message should be shown:

```
$ ./expense list
There are no expenses.
```
3. The same behavior should be provided by the `search` command:

```
$ ./expense search coffee
There are 2 expenses.
  6 | 2016-04-07 |         3.29 | Coffee
  8 | 2016-04-07 |         3.59 | More Coffee
--------------------------------------------------
Total                      6.88
$ ./expense search bananas
There are no expenses.
```

* LS Note:
Remember that you're working with `floating point numbers` when you calculate totals, and floating point numbers are inexact approximations of the values used. 
Thus, 0.1 + 0.2 != 0.3. Don't be surprised if your totals have more digits after the decimal point than you expect. 
The results may be a little different from the values shown, but should be very, very close.


* Problem:
  * the `list` command should also show the total for all the expenses. (total all the `amount` values)
      * if there are no expenses (like if there are no database rows) then the `list` command show show a no expenses message
  * the `search` commmand should also show the total for the shown expenses
 
* rules:
  * show the total amount with two decimal places
  * have the total functionality be used for both `list` an `search` 
  
* algorithm:
  * add a method called `display_expense_total`
  * have it take an argument called `query`
  * have it grab the data from the `amount` column from `query`
  * sum and round the total to two decimal places.
  * add the method call `display_expense_total` to the `display_expenses` method
