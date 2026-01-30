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

### departments
| Column | Type | Description |
|--------|------|-------------|
| department_id | SERIAL | Primary key |
| department_name | VARCHAR(100) | Name of department |
| location | VARCHAR(100) | Physical location |

### employees
| Column | Type | Description |
|--------|------|-------------|
| employee_id | SERIAL | Primary key |
| first_name | VARCHAR(50) | First name |
| last_name | VARCHAR(50) | Last name |
| email | VARCHAR(100) | Email address (unique) |
| hire_date | DATE | Date of hire |
| department_id | INTEGER | Foreign key to departments |
| job_title | VARCHAR(100) | Position title |
| salary | NUMERIC(10,2) | Annual salary |
| manager_id | INTEGER | Self-reference to employee's manager |

### projects
| Column | Type | Description |
|--------|------|-------------|
| project_id | SERIAL | Primary key |
| project_name | VARCHAR(100) | Name of project |
| start_date | DATE | Project start date |
| end_date | DATE | Project end date |
| budget | NUMERIC(15,2) | Project budget |

### employee_projects
| Column | Type | Description |
|--------|------|-------------|
| employee_id | INTEGER | Foreign key to employees |
| project_id | INTEGER | Foreign key to projects |
| role | VARCHAR(50) | Employee's role in project |
| hours_worked | NUMERIC(8,2) | Hours worked on project |

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