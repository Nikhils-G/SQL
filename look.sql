WITH EmployeeRank AS (
    SELECT 
        e.employee_id, 
        e.name, 
        d.department_name, 
        e.salary, 
        RANK() OVER (PARTITION BY d.department_name ORDER BY e.salary DESC) AS salary_rank
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
)
SELECT * 
FROM EmployeeRank 
WHERE salary_rank <= 3;
