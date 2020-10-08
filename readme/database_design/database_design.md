# Database Design

## This expenses command line project has persistent data.
## We're able to store each expense as its own entity in the database. As well as deleting an expense if we wish

## Expenses in our database have the following attributes:
* When the expense was created
* How much the expense was
* What the expense was for
* 
## Requirements
* Create a database to store the expenses managed by this project.


##Implementation
1. Design a table called expenses that can hold the data for expenses.
2. This table should have columns named id, amount, memo, and created_on.
3. Write the SQL to create that table into a file called schema.sql.
4. Create a database and use schema.sql to setup the database for the application.


### PEDAC/Problem Plan.
1. Problem:
  * create a table called `expenses` to hold each individual expense.
  * Each expense will be its own row in the data table.
  * CREATE SQl statements for table creation inside a new file called `schema.sql`
  * create a new database, and load the sql file into it (which will create the expense data table)
2. Rules
  * we need to uniquely identify each expense with an (`id`) column.
  * We also need the cost of each expense stored in dollars/cents as `amount` column
  * We need a `memo` column to hold the description/data of what each expense in (as a String)
  * need a `created_on` column to hold the `year-month-day` of when that expense item was created. 
    * `created_on` data should be automatically generated when an expense is added to the current date.
  * only allow positive values into the `amount` column. (add a check constraint)
  * When an expense is created make an amount and `memo` required (not null constraint)
3. Algorithm/
  * create a sql file called `schema.sql`
    * create a table called `expenses` with the following columns-
    * four columns
      * `id` -> type serial, primary key.
      * `amount` data type with two decimal places, NOT NULL
      * `memo` needs to hold unlimited text, Not NUll
      * `created_on` column to hold date formatted
        * needs a default value set to current time.
      * add a check constraint to only allow positive values (>0.00) in `amount` column
  * create a new database called `command_line_expenses_project`
  * load the `schema.sql` file into the the new database.
