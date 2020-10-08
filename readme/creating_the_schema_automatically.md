# Requirements
1. When a user runs the expense program for the first time, it should automatically create any tables it needs within the expenses database (notice there are no errors):

```
$ createdb expenses
$ ./expense list
There are no expenses.
```

# Implementation
  * The following query will return a value of `one` (1) if a table with the name expenses exists:
  
```sql
expenses=# SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'expenses';
 count
-------
     1
(1 row)
```

* If that table does not exist, the COUNT will return zero:

```sql
expenses=# SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'doesnotexist';
 
 count
-------
     0
(1 row)
```

1. Add a new method, `setup_schema` to `ExpenseData`. Call this method inside `ExpenseData#initialize`.
2. Inside `setup_schema`, use the query described above to see if the `expenses` table already exists. If it doesn't, create it.