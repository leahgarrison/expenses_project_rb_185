# Practice Problems

1. What happens if you use two placeholders in the first argument to `PG::Connection#exec_params`, 
 but only one in the Array of values used to fill in those placeholders?
* I expect that you'll get an error. The above method requires the number to arrays (values to interpolate) to match the number of params.
```sql
connection.exec_params("SELECT position($1 in $2)", ["e"]).values
PG::ProtocolViolation: ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2
```

2. Update the code within the `add_expense` method to use ``exec_params` instead of exec.
current code:
```sql
def add_expense(amount, memo, date)
  if date.nil? 
    sql = "INSERT INTO expenses (amount, memo) VALUES (#{amount}, '#{memo}')"
  else 
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES (#{amount}, '#{memo}', '#{date}}')"
  end 
  DATABASE.exec(sql)
end
```

* updated code
```sql
def add_expense(amount, memo, date)
  date = Date.today if date.nil? 
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
  DATABASE.exec_params(sql,[amount, memo, date] )
end
```


3. What happens when the same malicious arguments are passed to the program now?
* 
```sql
 ./expense add 0.01 "', '2015-01-01'); DROP TABLE expenses; --"
 
  ./expense list
  19 | 2020-10-05 |         0.01 | ', '2015-01-01'); DROP TABLE expenses; --
  
   ./expense add 3.59 "sally's"
   ./expense list
   18 | 2020-10-05 |         3.59 | sally's
 ```
* Now anything with a SQL meta meaning is ignored. eveything that's between the double quotes is only taken literally.
* so this malicious string ``.01 "', '2015-01-01'); DROP TABLE expenses; --"` is added as if it's a plain string. (not SQL)