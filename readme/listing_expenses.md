# Requirements
  1. Connect to the expenses database and print out the information for all expenses in the system.
  
1. Problem: Connect to the `command_line_expenses_project` database and display the info for all expenses in the database.
  * Using the pg connect to the database.
  * create a pg object that connects to the database called `database`.
  * display all the column names (including `id`) from the `expenses` table.
  * use a sql select statment to give us a `result` object that has all the expense data rows.
  * iterate through the result object in the `expenses` table. display the data for each row in the order of the listed columns.
  * OR we could uses
  * 
  
  * a tuple in PG means a hash (typically of the query results).
  * we can use an `each method` on the result object (which is the data from our sql query). 
    * the each method lets us iterate through each hash contained in the result object. each hash has the columns as the keys and the values as the row data. 
    * for each row in the hash
  
* code.
* I used an array max block to grab the longest length column and center the data based on that.
```
database = PG.connect(dbname: "command_line_expenses_project")
result = database.exec("SELECT * FROM expenses ORDER BY created_on ASC")
result.each_row do |row|
max_length = row.max { |a, b| a.length <=> b.length }.length
 puts row.join(" | ").rjust(max_length)
end
```
* we actually need the data in a specific order. not just how it appears in the table
* left to right 
* id, created_on, amount, memo
* so we can use the plain `each` method to iterate through the result (hash) tuple. but use a specific index to grab the correct column data.

* the ls SOLUTION BELOW grabs the correct data by column name. they also do not rjust the "memo" column because it has unlimited text length (type text)
```
database = PG.connect(dbname: "command_line_expenses_project")
result = database.exec("SELECT * FROM expenses ORDER BY created_on ASC")
result.each do |tuple|
  columns = [tuple["id"].rjust(3), 
            tuple["created_on"].rjust(10),
              tuple["amount"].rjust(12),
              tuple["memo"] ]
  puts columns.join(" | ")
end
```