# Requirements
1. Display a list of expenses when passed the list argument, and help content otherwise.



* LS note
  * For this assignment, we'll need access to the arguments passed into our CLI program. 
  * When writing a script, we can access the list of arguments passed into a command-line program with `ARGV`. 
  * In your Ruby script, ARGV will be an Array of arguments that have been passed to your command-line program.
 

* Problem:
  * change the default program output (when you run the program with no arguments)
  * currently all the expenses are displayed (upon program run without arguments)
  * only show all the expenses when the argument called `list` is included.
  * on default, show help info to the user (including a program description)
 * desired output for default output (no args)
 $ ./expense
An expense recording system

Commands:

add AMOUNT MEMO [DATE] - record a new expense
clear - delete all expenses
list - list all expenses
delete NUMBER - remove expense with id NUMBER
search QUERY - list expenses with a matching memo field


* # Implementation
1. Move the existing expense listing code into a method. called `display_expenses`
2. Add a new method that prints out the help content.
  * called `help`
  * if no arguments are passed to the program output the following: 'An expense recording system'
  * plus output the commands (see above)
3. Check the value of the first argument passed to the program, and call the appropriate method.


* algorithm
  * command line arguments are saved as strings.
  * add a conditional statement to call the `display_expenses` method if the first command line argument is 'list
  * otherwise call the `help method`.
  * 
  
