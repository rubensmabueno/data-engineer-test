"""
This module contains all the data used in the challenges.
Instead of using classes and repositories, we're using simple dictionaries.
"""

# Departments data
departments = [
    {"department_id": 1, "department_name": "Engineering", "location": "Building A"},
    {"department_id": 2, "department_name": "Sales", "location": "Building B"},
    {"department_id": 3, "department_name": "Marketing", "location": "Building B"},
    {"department_id": 4, "department_name": "Human Resources", "location": "Building C"},
    {"department_id": 5, "department_name": "Finance", "location": "Building C"},
    {"department_id": 6, "department_name": "Research", "location": "Building A"},
    {"department_id": 7, "department_name": "IT Support", "location": "Building D"},
]

# Employees data
employees = [
    {"employee_id": 1, "first_name": "John", "last_name": "Smith", "email": "john.smith@company.com", "hire_date": "2010-01-15", "department_id": 1, "job_title": "Engineering Director", "salary": 180000.00, "manager_id": None},
    {"employee_id": 2, "first_name": "Sarah", "last_name": "Johnson", "email": "sarah.johnson@company.com", "hire_date": "2011-03-20", "department_id": 2, "job_title": "Sales Director", "salary": 175000.00, "manager_id": None},
    {"employee_id": 3, "first_name": "Michael", "last_name": "Williams", "email": "michael.williams@company.com", "hire_date": "2012-05-10", "department_id": 3, "job_title": "Marketing Director", "salary": 170000.00, "manager_id": None},
    {"employee_id": 4, "first_name": "Emily", "last_name": "Brown", "email": "emily.brown@company.com", "hire_date": "2013-07-05", "department_id": 4, "job_title": "HR Director", "salary": 165000.00, "manager_id": None},
    {"employee_id": 5, "first_name": "David", "last_name": "Jones", "email": "david.jones@company.com", "hire_date": "2014-09-12", "department_id": 5, "job_title": "Finance Director", "salary": 185000.00, "manager_id": None},
    {"employee_id": 6, "first_name": "Robert", "last_name": "Miller", "email": "robert.miller@company.com", "hire_date": "2015-02-18", "department_id": 1, "job_title": "Senior Engineer", "salary": 120000.00, "manager_id": 1},
]

# Projects data
projects = [
    {"project_id": 1, "project_name": "Website Redesign", "start_date": "2022-01-01", "end_date": "2022-06-30", "budget": 500000.00},
    {"project_id": 2, "project_name": "Mobile App Development", "start_date": "2022-03-15", "end_date": "2022-12-31", "budget": 750000.00},
    {"project_id": 3, "project_name": "Cloud Migration", "start_date": "2022-05-01", "end_date": "2023-04-30", "budget": 1200000.00},
]

# Employee Projects data
employee_projects = [
    {"employee_id": 6, "project_id": 1, "role": "Project Lead", "hours_worked": 520.5},
    {"employee_id": 7, "project_id": 1, "role": "Frontend Developer", "hours_worked": 480.0},
    {"employee_id": 8, "project_id": 1, "role": "Backend Developer", "hours_worked": 510.2},
]