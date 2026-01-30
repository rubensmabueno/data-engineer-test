# SQL Aggregation Challenges

This directory contains SQL challenges focused on aggregation operations. The challenges are designed to test your knowledge of SQL aggregation functions, GROUP BY clauses, and window functions.

## Setup

1. Start the PostgreSQL database and pgweb with Docker Compose:

```bash
docker-compose up -d
```

2. Access pgweb in your browser at http://localhost:8080
   - No login required - you'll be automatically connected to the database!
   - The interface is simple and ready to use immediately
   - Just start writing your SQL queries in the Query tab

## Database Schema

The database contains the following tables:

### departments
| Column | Type | Description |
|--------|------|-------------|
| department_id | SERIAL | Primary key |
| department_name | VARCHAR(100) | Name of the department |
| location | VARCHAR(100) | Physical location of the department |

### employees
| Column | Type | Description |
|--------|------|-------------|
| employee_id | SERIAL | Primary key |
| first_name | VARCHAR(50) | Employee's first name |
| last_name | VARCHAR(50) | Employee's last name |
| email | VARCHAR(100) | Employee's email address (unique) |
| hire_date | DATE | Date when employee was hired |
| department_id | INTEGER | Foreign key to departments table |
| job_title | VARCHAR(100) | Employee's job title |
| salary | NUMERIC(10,2) | Employee's annual salary |
| manager_id | INTEGER | Self-referencing foreign key to employee's manager |

### projects
| Column | Type | Description |
|--------|------|-------------|
| project_id | SERIAL | Primary key |
| project_name | VARCHAR(100) | Name of the project |
| start_date | DATE | Project start date |
| end_date | DATE | Project end date |
| budget | NUMERIC(15,2) | Project budget |

### employee_projects
| Column | Type | Description |
|--------|------|-------------|
| employee_id | INTEGER | Foreign key to employees table |
| project_id | INTEGER | Foreign key to projects table |
| role | VARCHAR(50) | Employee's role in the project |
| hours_worked | NUMERIC(8,2) | Hours worked by employee on the project |

The schema represents a company structure with departments and employees. Each employee belongs to a department and may have a manager who is also an employee. The company runs multiple projects, and employees can work on multiple projects with different roles and hours.

## Challenges

### Challenge 1: Basic Aggregation with GROUP BY

Write a SQL query to find the following information:

1. Calculate the average salary for each department
2. Count the number of employees in each department
3. Find the highest and lowest paid employee in each department
4. Calculate the total salary budget for each department

**Expected output format:**

```
department_name | average_salary | employee_count | highest_salary | lowest_salary | total_salary_budget
----------------|----------------|----------------|----------------|---------------|--------------------
Engineering     | 112500.00      | 5              | 180000.00      | 75000.00      | 562500.00
Finance         | 128333.33      | 3              | 185000.00      | 80000.00      | 385000.00
Human Resources | 112333.33      | 3              | 165000.00      | 72000.00      | 337000.00
...
```

For example, the Engineering department has 5 employees with an average salary of $112,500. The highest paid employee earns $180,000 while the lowest paid earns $75,000. The total salary budget for the department is $562,500.

### Challenge 2: Advanced Aggregation with Window Functions

Building on Challenge 1, write a SQL query to:

1. Calculate each employee's salary compared to their department's average (as a percentage)
2. Rank employees within each department by their salary
3. Calculate running total of salary within each department (ordered by hire date)
4. Calculate the difference between each employee's salary and the next highest salary in their department

**Expected output format:**

```
employee_name    | department_name | salary   | dept_avg_salary | pct_of_dept_avg | salary_rank | running_salary_total | salary_diff_to_next
----------------|-----------------|----------|-----------------|-----------------|-------------|----------------------|--------------------
John Smith      | Engineering     | 180000.00| 112500.00       | 160.00          | 1           | 180000.00            | 60000.00
Robert Miller   | Engineering     | 120000.00| 112500.00       | 106.67          | 2           | 300000.00            | 25000.00
Jennifer Davis  | Engineering     | 95000.00 | 112500.00       | 84.44           | 3           | 395000.00            | 3000.00
William Garcia  | Engineering     | 92000.00 | 112500.00       | 81.78           | 4           | 487000.00            | 17000.00
Elizabeth Rod.  | Engineering     | 75000.00 | 112500.00       | 66.67           | 5           | 562000.00            | 0.00
...
```

For example, John Smith from Engineering earns $180,000, which is 160% of his department's average salary. He is ranked #1 in his department by salary. Since he was hired first in his department, the running total equals his salary. The difference between his salary and the next highest salary (Robert Miller's $120,000) is $60,000.

## Solutions

Example solutions are provided in the `solutions` directory, but try to solve the challenges on your own first!

### Hints for Challenge 1
- Use the `GROUP BY` clause to group results by department
- Use aggregate functions like `AVG()`, `COUNT()`, `MAX()`, `MIN()`, and `SUM()`
- Join the `employees` and `departments` tables to get department names

### Hints for Challenge 2
- Use window functions with `OVER (PARTITION BY department_id ...)`
- The `RANK()` function can be used for ranking employees
- Use `ORDER BY hire_date` with window functions to calculate running totals
- The `LEAD()` function can help find the next highest salary