# adding functionality to let the user add in expenses through command line arguments.

# Requirements
  1. Add a command, add, that can be used to add new expenses to the system. It should look like this in use:
```
  $ ./expense add 3.59 "More Coffee"
$ ./expense list
  1 | 2016-04-05 |        14.56 | Pencils
  2 | 2016-04-05 |         3.29 | Coffee
  3 | 2016-04-05 |        49.99 | Text Editor
  4 | 2016-04-06 |         3.59 | More Coffee

```
  2. Make sure that this command is always passed any additional parameters needed to add an expense. If it isn't display an error message:

```
$ ./expense add
You must provide an amount and memo.
```

* Problem:
  * enable the user to add expense items
  * if the user types the `add` command with no other arguments show an error message (and do not add that as an expense)
  * 
  
* Rules: 
 * our table `expenses` is set up to automatically set up the data for today (current date) if no data is passed
 * so only the `memo` and `amount` values are neeed to successfully add a new expense into our database. 
 * the database must now add this expense into the `expense` table as another row. (this will allow the `list` command to show all the expenses accurately
 * as specified in our `help` commands. the ordering of argument is as follows:
   * `add AMOUNT MEMO [DATE] - record a new expense`
   * the first input argument after `add` is the value for amount, then memo. the date argument is optional. (it has a default value in our table)
 * 
 
* algorithm
  * move the database connecting code into a method called `setup`. 
    * have it set the pg connection object to a constant called `DB`
  * add two lines to the argument conditional. 
    * if the first argument is `add`, and there are no other arguments. return the `You must provide an amount and memo.` error.
      * if the argument array is less than 3. error. (means missing amount and memo)
    * (be sure to include the conditional with the error before the non-error one.)
    * if the first argument is `add` call the `add_expense` method
  * create a new method called `add_expense`. 
    * use the `DB` object.
    * save the first command line arg as `amount`
    * save the 2nd command line arg as `memo`.
    * save the 3rd command line arg as `date` (if there is one)
    * using SQL, insert the data into the expenses table.
    * 
* error ran into - data that's a string in SQL must be in sql quotes. so you have to add them around it