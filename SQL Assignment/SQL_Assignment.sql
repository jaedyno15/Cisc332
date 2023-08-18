# SQL Assignment - My Solutions

# Which employees earn the minimum salary? List their name and SSN
SELECT FName, Minit, LName, SSN FROM employee WHERE Salary = (select min(Salary) as minSalary from Employee);

# Which employees have both a spouse and a daughter dependent? List first and last name
SELECT FNAME, LNAME FROM employee join (select a.ESSN as SSN FROM dependent a inner join dependent b on a.ESSN = b.ESSN WHERE a.Relationship = 'DAUGHTER' and b.Relationship = 'SPOUSE') as Temp on employee.SSN = Temp.SSN;

# Which projects do Wong, Borg, and English work on? (All not combined). List name and project name
SELECT PName, FName, LName FROM (project INNER JOIN works_on ON PNumber = PNo) INNER JOIN employee ON ESSN = SSN WHERE LName = 'Wong'OR LName = 'Borg' OR LName = 'English';

# List of all male managers who earn more than $30,000. List full name, SSN, and person's salary
SELECT FName, Minit, LName, SSN, salary FROM employee INNER JOIN Department ON SSN = MGRSSN WHERE salary > 30000 AND SEX = 'M';

# List all projects that are worked on by both Narayan and Jabber. List project name and id
SELECT PName, PNumber FROM (project INNER JOIN works_on ON PNumber = PNo) INNER JOIN employee ON ESSN = SSN WHERE LName = 'Narayan' OR LName = 'Jabber' GROUP BY PName HAVING COUNT(PName) > 1;

# For each employee who has a dependant born after 1970, list the employee name and ~age of the dependent
SELECT FName, Minit, LName, TIMESTAMPDIFF(year, dependent.Bdate, '2023/01/01') AS age FROM employee INNER JOIN dependent ON SSN = ESSN WHERE dependent.Bdate > '1970-01-01';

#List the employees that work on projects located in Houston. List their full name, project name, and total hours worked on the project
SELECT FName, Minit, LName, PName, Hours FROM ((project INNER JOIN works_on ON PNumber = PNo) INNER JOIN employee ON ESSN = SSN) WHERE PLocation = 'Houston';

# List all employees and their supervisor's names. If no supervisor, show null
SELECT B.FName AS superFName, B.Minit AS superMinit, B.LName AS superLName, A.FName AS FName, A.Minit AS Minit, A.LName FROM employee A, employee B WHERE A.SuperSSN = B.SSN;

# List each project, the project name, the manager's first and last name, and the location
SELECT PName, PLocation, FName, LName FROM ((project INNER JOIN works_on ON PNumber = PNo) INNER JOIN employee ON ESSN = SSN) WHERE SSN = 333445555 OR SSN = 888665555 OR SSN = 987654321;

# Which manager makes the most money? List first and last name
SELECT FName, LName, MAX(salary) AS max_sal FROM employee INNER JOIN Department ON SSN = MGRSSN;

