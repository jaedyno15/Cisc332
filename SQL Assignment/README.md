# SQL Assignment

Use the database and run the following queries. Your queries should be general and work for any set of data, not just the data that is currently in the database. Some queries may produce no results. You must not make assumptions about what you know about the data -- SQL must be used to specify the entire query. For instance, if I ask about which employees work in the "Administration" department, you cannot use the department number 4. Instead, you must use SQL to find out the department number for the Administration department. All results should have appropriately named columns.

1. Which employees earn the minimum salary. The minimum salary will be defined as the lowest recorded salary in the database. List the employee's name (first and last) and SSN.
2. Which employees have both a spouse and a daughter dependent? List the employee's first and last names.
3. Which projects do Wong, Borg and English work on? (All projects, not just those that they work on together). List the employee's name (first and last) and the name of the project that they work on.
4. You wish to see a list of all male managers who earn more than $30,000. You need to see full names, SSNs and the person's salary. (Managers are listed as MGRSSN in the department table).
5. List all projects that are worked on by both (ie. not either or, but both) Narayan and Jabbar. List the project name and id.
6. For each employee who has a dependent born after 1970, list the employee's name (first and last) and the (approximate) age of their dependent. Use the current year and their year of birth to get an approximate age.
7. List the employees that work on projects located in Houston. List the employee's first and last name, the project name, along with the total number of hours that they work on this project. List only the projects they work on in Houston.
8. Make a list of all the employees and their supervisor's (first and last) names. If they do not have a supervisor, they should still appear in the list, but the supervisor's name should be null.
9. Make a list that includes, for each project, the project name, the manager's first and last name and the project's location.
10. Which manager makes the most money? Show their first and last name.

# What to Submit
Hand in a script containing all of your queries. This script should run when imported into mysql.