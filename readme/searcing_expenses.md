# Requirements
1. Allow users to search for expenses that match a specified term:
 
* Problem:
  * add functionality to let the user search for one specified search term.
  * anywhere that term is found in `memo` value, then display those results.
  
* algorithm:
  * add a `when` conditional line to the case statement in `CLI #run`. 
    * this will catch the command line argument called `search`
    * grab the second command line argument, and set it equal to a local variable called `search_term`
    * call the `ExpenseData #search` method on the `application` object(from the `initialize` method)
      * pass the `search_term` local variable to `#search`
  * create a method called `search_expenses` to `ExpenseData` class
    * it should take a string argument called `search_term`.
    * create a variable called `sql` to hold the select query.
      * select all the rows from the `expenses` table, but use a conditional to check the `memo` column for the `search_term`
      * use regex to check if that search term is found anywhere in memo (ignoring any letters that come before/after: use `%` meta character
      * execute the query using the `sql` variable. save it to a local variable called `query`
      * call the `display_expenses` method, passing the `query` term as an argument
  * update `display_expenses` in `ExpenseData`.
    * add a parameter called expenses, which will the sql search results
    * remove the query search. 
    * pass `expenses` to the `each` block