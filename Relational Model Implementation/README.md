# Restaurant Database Relational Implementation

You will now convert the ER schema to a relational schema using the algorithm shown in class. Create all the tables via a script that you will import into MySQL. You may use the company database script as a template.  You should NOT be using the graphical interface to build your tables, you must write the SQL create table statements yourself. Using the output from the GUI will result in zero on the assignment. (Yes, we can tell the difference).

Call your database restaurantDB. At the top of you script you must have the following lines so that the database is created in the script:

```
drop database if exists restaurantDB;
create database restaurantDB;
```

Make sure you indicate the primary key and any foreign keys, as well as NOT NULL constraints for each table/attribute. Populate your table with some reasonable data. A few tuples (6-8) for each table is expected.  Adding data should be done by a series of insert statements in your script. (See the company database example).

Please note, there are tools that exist that translate ER schemas to Relational Schemas automatically.  However, they may not translate to the same Relational Schema as you would end up with by using the algorithm shown in class. Your assignment will be marked using the algorithm shown in class -- other translations will be considered incorrect.

Be sure that you specify the "on delete" constraints for any foreign keys.

You should try running your script in MySQL prior to submitting to ensure that it runs without error.

You should NOT be turning off the foreign key checking when you run your script.

# What to Submit
Submit your ER diagram from the last assignment in either .pdf or .jpg format. You may modify your diagram to fix any errors. Hand in the modified version. Submit your script file as a plain text file. PDF or MS Word (or equivalent) formats will NOT be accepted. TAs will run your scripts and must be able to simply download the script and import into their MySQL database.


