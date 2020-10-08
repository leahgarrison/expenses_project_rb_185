# Requirements
1. Update the code so it falls in line with the design described in the above video.

* Problem: update the code structure into the correct classes/objects
* An `ExpenseData` class processes the data it receives from the `CLI` class.
* the CLI class processes the command line arguments, and passes it to the `ExpenseDate` class via method calls.
* the`ExpenseData` class communicates with the database and formats the output (outputs the data back to the command line/user)
* the CLI class processes the arguments into the correct data type in Ruby. 
* then the CLI class will make separate method calls on a separate object created from the `ExpenseData` class
* the `ExpenseData` object will be the main application object handles the business logic and interacts with other objects in the system(in this case just the database)

* algorithm:
  * create a class called `ExpenseData`.
  * create a class
  * move the `add_expense`, `help`, and the `display_expenses` methods into the `ExpenseClass`
  * 
  
### Implementation
1. Move the `add_expense` and `list_expenses` methods into a new class, `ExpenseData`.
2. Change the `CONNECTION` constant (my DATABASE constant) to an instance variable. 
  * We want to have a clear separation of responsibilities for our application. 
  * We want to ensure that access to the database connection is restricted to `ExpenseData`, since we're encapsulating database interaction within `ExpenseData`.
3. Move the parameter handling into a new class, `CLI`. Create an instance of `ExpenseData` in `CLI#initialize`.
4. Create a new instance of `CLI` and call run on it, passing `ARGV`.