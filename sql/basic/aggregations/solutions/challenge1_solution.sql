-- Challenge 1: Basic Aggregation with GROUP BY

-- Calculate the average salary, count of employees, highest salary, lowest salary, and total salary budget for each department
SELECT 
    d.department_name,
    ROUND(AVG(e.salary), 2) AS average_salary,
    COUNT(e.employee_id) AS employee_count,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary,
    SUM(e.salary) AS total_salary_budget
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    d.department_name;

-- Additional query to show which employees have the highest and lowest salaries in each department
WITH ranked_employees AS (
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        e.salary,
        d.department_name,
        ROW_NUMBER() OVER (PARTITION BY d.department_id ORDER BY e.salary ASC) AS salary_rank_asc,
        ROW_NUMBER() OVER (PARTITION BY d.department_id ORDER BY e.salary DESC) AS salary_rank_desc
    FROM 
        employees e
    JOIN 
        departments d ON e.department_id = d.department_id
)
SELECT 
    department_name,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    salary,
    CASE 
        WHEN salary_rank_asc = 1 THEN 'Lowest paid'
        WHEN salary_rank_desc = 1 THEN 'Highest paid'
    END AS salary_status
FROM 
    ranked_employees
WHERE 
    salary_rank_asc = 1 OR salary_rank_desc = 1
ORDER BY 
    department_name, 
    salary_rank_desc;