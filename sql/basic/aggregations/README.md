# SQL Challenges: Employee Data Analysis

## Setup

1. Start the environment:
```bash
docker-compose up -d
```

2. Access the SQL editor at http://localhost:8080
   - You're automatically connected to the database
   - Start writing queries in the Query tab

## Database Schema

The database contains information about employees, departments, projects, and assignments:

- **departments**: Department information (id, name, location)
- **employees**: Employee details (id, name, email, hire_date, salary, etc.)
- **projects**: Project information (id, name, dates, budget)
- **employee_projects**: Which employees work on which projects

## Challenge 1: Department Analysis

The HR team needs a report showing key department statistics.

**Your task:** Create a single query that shows for each department:
- Number of employees
- Average salary
- Highest and lowest salaries
- Total salary budget

**Sample output:**
```
department_name | employee_count | average_salary | highest_salary | lowest_salary | total_budget
----------------|----------------|----------------|----------------|---------------|-------------
Engineering     | 5              | 112500.00      | 180000.00      | 75000.00      | 562500.00
Finance         | 3              | 128333.33      | 185000.00      | 80000.00      | 385000.00
...
```

## Challenge 2: Salary Insights

The CEO wants deeper insights into employee compensation across departments.

**Your task:** Create a single query showing:
- Each employee's name and salary
- How their salary compares to their department's average (%)
- Their salary rank within the department
- Running total of department salaries (cumulative sum of salaries ordered by hire date)
- Salary difference to the next highest-paid colleague

**Sample output:**
```
employee_name | department_name | salary    | vs_dept_avg | rank | running_total | gap_to_next
--------------|-----------------|-----------|-------------|------|---------------|------------
John Smith    | Engineering     | 180000.00 | 160.00%     | 1    | 180000.00     | 60000.00
Robert Miller | Engineering     | 120000.00 | 106.67%     | 2    | 300000.00     | 25000.00
...
```
