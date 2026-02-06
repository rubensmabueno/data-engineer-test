# Python Challenges: Employee Data Analysis

## Setup

1. Make sure you have Python 3.6+ installed in your environment.

2. Run the Python code from the project root folder:
```bash
cd python/basic/aggregations
python main.py
```

## Data Structure

The data is available through repository classes that follow the Repository pattern. Each repository provides access to a collection of entities.

### Department
| Attribute | Type | Description |
|-----------|------|-------------|
| department_id | int | Primary key |
| department_name | str | Department name |
| location | str | Physical location |

### Employee
| Attribute | Type | Description |
|-----------|------|-------------|
| employee_id | int | Primary key |
| first_name | str | First name |
| last_name | str | Last name |
| email | str | Email address (unique) |
| hire_date | str | Date of hire |
| department_id | int | Foreign key to departments |
| job_title | str | Position title |
| salary | float | Annual salary |
| manager_id | Optional[int] | Self-reference to employee's manager |

### Project
| Attribute | Type | Description |
|-----------|------|-------------|
| project_id | int | Primary key |
| project_name | str | Project name |
| start_date | str | Project start date |
| end_date | str | Project end date |
| budget | float | Project budget |

### EmployeeProject
| Attribute | Type | Description |
|-----------|------|-------------|
| employee_id | int | Foreign key to employees |
| project_id | int | Foreign key to projects |
| role | str | Employee's role in project |
| hours_worked | float | Hours worked on project |

## Challenge 1: Department Analysis

The HR team needs a report showing key department statistics.

**Your task:** Process the data and generate for each department:
- Number of employees
- Average salary
- Highest and lowest salaries
- Total salary budget

**Expected output format:**
```python
[
    {
        "department_name": "Engineering",
        "employee_count": 5,
        "average_salary": 112500.00,
        "highest_salary": 180000.00,
        "lowest_salary": 75000.00,
        "total_budget": 562500.00
    },
    {
        "department_name": "Finance",
        "employee_count": 3,
        "average_salary": 128333.33,
        "highest_salary": 185000.00,
        "lowest_salary": 80000.00,
        "total_budget": 385000.00
    },
    # ...
]
```

## Challenge 2: Salary Insights

The CEO wants deeper insights into employee compensation across departments.

**Your task:** Generate data showing:
- Each employee's name and salary
- How their salary compares to their department's average (%)
- Their salary rank within the department
- Running total of department salaries (cumulative sum of salaries ordered by hire date)
- Salary difference to the next highest-paid colleague

**Expected output format:**
```python
[
    {
        "employee_name": "John Smith",
        "department_name": "Engineering",
        "salary": 180000.00,
        "vs_dept_avg": 160.00,  # percentage
        "rank": 1,
        "running_total": 180000.00,
        "gap_to_next": 60000.00
    },
    {
        "employee_name": "Robert Miller",
        "department_name": "Engineering",
        "salary": 120000.00,
        "vs_dept_avg": 106.67,  # percentage
        "rank": 2,
        "running_total": 300000.00,
        "gap_to_next": 25000.00
    },
    # ...
]
```

## Tips
## Solution

Implement your solutions in the `main.py` file