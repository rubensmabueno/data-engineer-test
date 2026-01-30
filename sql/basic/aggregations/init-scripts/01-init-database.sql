-- Create tables for employee data
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    department_id INTEGER REFERENCES departments(department_id),
    job_title VARCHAR(100),
    salary NUMERIC(10, 2),
    manager_id INTEGER REFERENCES employees(employee_id)
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget NUMERIC(15, 2)
);

CREATE TABLE employee_projects (
    employee_id INTEGER REFERENCES employees(employee_id),
    project_id INTEGER REFERENCES projects(project_id),
    role VARCHAR(50),
    hours_worked NUMERIC(8, 2),
    PRIMARY KEY (employee_id, project_id)
);

-- Insert data into departments
INSERT INTO departments (department_name, location) VALUES
('Engineering', 'Building A'),
('Sales', 'Building B'),
('Marketing', 'Building B'),
('Human Resources', 'Building C'),
('Finance', 'Building C'),
('Research', 'Building A'),
('IT Support', 'Building D');

-- Insert data into employees
-- First insert managers (employees with no manager)
INSERT INTO employees (first_name, last_name, email, hire_date, department_id, job_title, salary, manager_id) VALUES
('John', 'Smith', 'john.smith@company.com', '2010-01-15', 1, 'Engineering Director', 180000.00, NULL),
('Sarah', 'Johnson', 'sarah.johnson@company.com', '2011-03-20', 2, 'Sales Director', 175000.00, NULL),
('Michael', 'Williams', 'michael.williams@company.com', '2012-05-10', 3, 'Marketing Director', 170000.00, NULL),
('Emily', 'Brown', 'emily.brown@company.com', '2013-07-05', 4, 'HR Director', 165000.00, NULL),
('David', 'Jones', 'david.jones@company.com', '2014-09-12', 5, 'Finance Director', 185000.00, NULL);

-- Then insert other employees with manager references
INSERT INTO employees (first_name, last_name, email, hire_date, department_id, job_title, salary, manager_id) VALUES
('Robert', 'Miller', 'robert.miller@company.com', '2015-02-18', 1, 'Senior Engineer', 120000.00, 1),
('Jennifer', 'Davis', 'jennifer.davis@company.com', '2016-04-22', 1, 'Software Engineer', 95000.00, 6),
('William', 'Garcia', 'william.garcia@company.com', '2017-06-30', 1, 'Software Engineer', 92000.00, 6),
('Elizabeth', 'Rodriguez', 'elizabeth.rodriguez@company.com', '2018-08-14', 1, 'Junior Engineer', 75000.00, 6),
('Richard', 'Martinez', 'richard.martinez@company.com', '2019-10-25', 2, 'Sales Manager', 110000.00, 2),
('Patricia', 'Hernandez', 'patricia.hernandez@company.com', '2020-01-05', 2, 'Sales Representative', 85000.00, 10),
('Charles', 'Lopez', 'charles.lopez@company.com', '2020-03-15', 2, 'Sales Representative', 82000.00, 10),
('Linda', 'Gonzalez', 'linda.gonzalez@company.com', '2020-05-20', 3, 'Marketing Manager', 105000.00, 3),
('Thomas', 'Wilson', 'thomas.wilson@company.com', '2020-07-30', 3, 'Marketing Specialist', 78000.00, 13),
('Barbara', 'Anderson', 'barbara.anderson@company.com', '2020-09-10', 3, 'Marketing Analyst', 76000.00, 13),
('Joseph', 'Thomas', 'joseph.thomas@company.com', '2020-11-15', 4, 'HR Manager', 100000.00, 4),
('Margaret', 'Taylor', 'margaret.taylor@company.com', '2021-01-20', 4, 'HR Specialist', 72000.00, 16),
('Christopher', 'Moore', 'christopher.moore@company.com', '2021-03-25', 5, 'Finance Manager', 115000.00, 5),
('Jessica', 'Jackson', 'jessica.jackson@company.com', '2021-05-05', 5, 'Accountant', 80000.00, 18),
('Daniel', 'Martin', 'daniel.martin@company.com', '2021-07-10', 5, 'Financial Analyst', 85000.00, 18),
('Nancy', 'Lee', 'nancy.lee@company.com', '2021-09-15', 6, 'Research Manager', 112000.00, 1),
('Matthew', 'Perez', 'matthew.perez@company.com', '2021-11-20', 6, 'Research Scientist', 90000.00, 21),
('Betty', 'Thompson', 'betty.thompson@company.com', '2022-01-25', 6, 'Research Analyst', 78000.00, 21),
('Anthony', 'White', 'anthony.white@company.com', '2022-03-30', 7, 'IT Manager', 108000.00, 1),
('Dorothy', 'Harris', 'dorothy.harris@company.com', '2022-05-05', 7, 'System Administrator', 88000.00, 24),
('Donald', 'Sanchez', 'donald.sanchez@company.com', '2022-07-10', 7, 'IT Support Specialist', 70000.00, 24),
('Sandra', 'Clark', 'sandra.clark@company.com', '2022-09-15', 7, 'Network Engineer', 92000.00, 24);

-- Insert data into projects
INSERT INTO projects (project_name, start_date, end_date, budget) VALUES
('Website Redesign', '2022-01-01', '2022-06-30', 500000.00),
('Mobile App Development', '2022-03-15', '2022-12-31', 750000.00),
('Cloud Migration', '2022-05-01', '2023-04-30', 1200000.00),
('Data Warehouse Implementation', '2022-07-15', '2023-01-31', 650000.00),
('CRM Integration', '2022-09-01', '2023-02-28', 450000.00),
('Security Audit', '2022-11-15', '2023-01-15', 200000.00),
('AI Research Initiative', '2023-01-01', '2023-12-31', 1500000.00);

-- Insert data into employee_projects
INSERT INTO employee_projects (employee_id, project_id, role, hours_worked) VALUES
(6, 1, 'Project Lead', 520.5),
(7, 1, 'Frontend Developer', 480.0),
(8, 1, 'Backend Developer', 510.2),
(9, 1, 'UI/UX Designer', 320.0),
(14, 1, 'Marketing Consultant', 120.0),
(6, 2, 'Technical Advisor', 180.0),
(7, 2, 'Mobile Developer', 620.5),
(8, 2, 'Backend Developer', 580.0),
(22, 2, 'QA Tester', 410.0),
(13, 2, 'Marketing Strategist', 150.0),
(6, 3, 'Project Manager', 350.0),
(20, 3, 'Cloud Architect', 680.5),
(24, 3, 'System Administrator', 520.0),
(25, 3, 'Network Engineer', 490.0),
(19, 3, 'Financial Analyst', 120.0),
(21, 4, 'Data Scientist', 580.0),
(22, 4, 'Data Analyst', 620.5),
(19, 4, 'Financial Advisor', 150.0),
(6, 4, 'Technical Consultant', 200.0),
(10, 5, 'Sales Consultant', 320.0),
(11, 5, 'Sales Representative', 280.5),
(12, 5, 'Sales Representative', 290.0),
(7, 5, 'Technical Consultant', 180.0),
(24, 6, 'Security Lead', 350.0),
(25, 6, 'Security Analyst', 320.5),
(26, 6, 'IT Support', 280.0),
(21, 7, 'Research Lead', 420.0),
(22, 7, 'Research Scientist', 580.5),
(23, 7, 'Research Analyst', 540.0),
(6, 7, 'Technical Advisor', 150.0);