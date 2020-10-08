1. Can you see any potential issues with the Solution code above?
  * hint:
    * Try adding an expense with the memo Gas for Karen's Car.
  * I expect that we won't be able to add it, since in SQL any out of place single quotes indicate the end of string.
  
* yes we get an error
```sql 

./expense add 5.50 "Gas for Karen's Car"
Traceback (most recent call last):
        2: from ./expense:47:in `<main>'
        1: from ./expense:35:in `add_expense'
./expense:35:in `exec': ERROR:  syntax error at or near "s" (PG::SyntaxError)
LINE 1: ...expenses (amount, memo) VALUES (5.50, 'Gas for Karen's Car')
```
* to get around this, we can check if an input string contains any single quotes. 
* we can get the index of where that single quote is, and add another single quote right next to that one
* a single quote has a special meanining in SQL, so that's where we get a problem