# Practice Problems

1. What is the largest value that can be stored in the amount column? Use psql to illustrate what it is.

* Problem: get the max value that can be stored in the `amount` column using psql.
  * - largest value stored in that datatype `numeric(6,2)`
* Algorithm. insert the max value. then try to insert the max value above it; will get an error
  * max value will be 9999.99 
```sql
INSERT into expenses(amount, memo)
VALUES(9999.99, 'largest value');
```

* The above should successfully insert into the table.
* The data below is the next largest data above 9999.99 being 10000.00
* inserting the data below will get an error
* 

```sql
INSERT into expenses(amount, memo)
VALUES(10000.00, 'overflow max value');
```



* data added succcessfully - max value is 9999.99
```sql
INSERT into expenses(amount, memo)
command_line_expenses_project-# VALUES(9999.99, 'largest value');
INSERT 0 1
command_line_expenses_project=# select * from expenses
command_line_expenses_project-# ;
 id | amount  |     memo      | created_on 
----+---------+---------------+------------
  1 | 9999.99 | largest value | 2020-10-04
(1 row)
```

* error, too big of a value entered (just 0.01 above)
```sql 
 INSERT into expenses(amount, memo)
command_line_expenses_project-# VALUES(10000.00, 'overflow max value');
ERROR:  numeric field overflow
DETAIL:  A field with precision 6, scale 2 must round to an absolute value less than 10^4.
command_line_expenses_project=# 
```


2. What is the smallest value that can be stored in the amount column? Use psql to illustrate what it is.
 * the smallest value added with the datatype of numeric(6,2) is -9999.99
 * (I'll remove the "expenses_amount_check" constaint that only allows positive numbers in the `amount column`). then add it back in
 * Any value smaller than -9999.99 is not allowed
 * 
```sql
ALTER TABlE expenses 
  DROP CONSTRAINT "expenses_amount_check"; 
    
INSERT into expenses(amount, memo)
VALUES(-9999.99, 'smallest value');

INSERT into expenses(amount, memo)
VALUES(-10000.00, 'lowest value- not allowed');

ALTER TABlE expenses 
  ADD CHECK (amount > 0.00);
```
* Actual: 

```sql 
INSERT into expenses(amount, memo)
command_line_expenses_project-# VALUES(-9999.99, 'smallest value');
INSERT 0 1

INSERT into expenses(amount, memo)
command_line_expenses_project-# VALUES(-10000.00, 'lowest value- not allowed');
ERROR:  numeric field overflow
DETAIL:  A field with precision 6, scale 2 must round to an absolute value less than 10^4.
```

3. Add a check constraint to the expenses table to ensure that amount only holds a positive value.
* add back the constraint that prevents negative values in the `amount` column.
* To add this constraint, I have to remove any rows that have a negative value in the `amount` column.

```sql 
DELETE FROM expenses
  WHERE amount < 0.00;

ALTER TABlE expenses 
  ADD CHECK (amount > 0.00);
```

* LS note: It's a good idea to add this ALTER TABLE statement to schema.sql, so it'll be there if you recreate the database during a future assignment.
* (this constraint is already part of the `create table` statement - all good).