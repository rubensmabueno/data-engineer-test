-- Challenge 2: Advanced Aggregation with Window Functions

-- Calculate each employee's salary compared to department average, rank within department,
-- running total by hire date, and difference to next highest salary
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    e.salary,
    
    -- Department average salary
    ROUND(AVG(e.salary) OVER (PARTITION BY e.department_id), 2) AS dept_avg_salary,
    
    -- Salary as percentage of department average
    ROUND((e.salary / AVG(e.salary) OVER (PARTITION BY e.department_id)) * 100, 2) AS pct_of_dept_avg,
    
    -- Salary rank within department
    RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank,
    
    -- Running total of salary within department (ordered by hire date)
    SUM(e.salary) OVER (
        PARTITION BY e.department_id 
        ORDER BY e.hire_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary_total,
    
    -- Difference between employee's salary and the next highest salary in their department
    e.salary - LEAD(e.salary, 1, NULL) OVER (
        PARTITION BY e.department_id 
        ORDER BY e.salary
    ) AS salary_diff_to_next
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    d.department_name, 
    e.salary DESC;

-- Alternative version with more detailed analysis
WITH dept_stats AS (
    SELECT 
        e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
        e.salary,
        e.hire_date,
        e.department_id,
        d.department_name,
        AVG(e.salary) OVER (PARTITION BY e.department_id) AS dept_avg_salary,
        RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank,
        SUM(e.salary) OVER (
            PARTITION BY e.department_id 
            ORDER BY e.hire_date 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_salary_total,
        LEAD(e.salary, 1, NULL) OVER (
            PARTITION BY e.department_id 
            ORDER BY e.salary DESC
        ) AS next_lower_salary
    FROM 
        employees e
    JOIN 
        departments d ON e.department_id = d.department_id
)
SELECT 
    employee_name,
    department_name,
    salary,
    ROUND(dept_avg_salary, 2) AS dept_avg_salary,
    ROUND((salary / dept_avg_salary) * 100, 2) AS pct_of_dept_avg,
    salary_rank,
    running_salary_total,
    COALESCE(salary - next_lower_salary, 0) AS salary_diff_to_next,
    CASE 
        WHEN salary > dept_avg_salary THEN 'Above Average'
        WHEN salary = dept_avg_salary THEN 'Average'
        ELSE 'Below Average'
    END AS salary_category
FROM 
    dept_stats
ORDER BY 
    department_name, 
    salary_rank;