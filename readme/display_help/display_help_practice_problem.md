# practice problem
* LS code 
```
#! /usr/bin/env ruby

require "pg"

def list_expenses
  connection = PG.connect(dbname: "expenses")

  result = connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
  result.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"] ]

    puts columns.join(" | ")
  end
end

def display_help
  puts <<~HELP
    An expense recording system

    Commands:

    add AMOUNT MEMO [DATE] - record a new expense
    clear - delete all expenses
    list - list all expenses
    delete NUMBER - remove expense with id NUMBER
    search QUERY - list expenses with a matching memo field
  HELP
end

command = ARGV.first
if command == "list"
  list_expenses
else
  display_help
end
```

1. Describe what is happening on line 20 of the Solution shown above. (line 23 here
* the line `puts <<~HELP`
* 
* This new syntax that has the squiggly (<<~) instead of <<-HEREDOC is a better way to format indented multi-line strings
* It strips the leading whitespace so that you no longer have to change your code indenting (farther left) to fix it.
* this is so even the first line matches up with the rest of the text.