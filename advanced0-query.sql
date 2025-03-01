-- Using Common Table Expressions (CTE)
WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member for recursive CTE
    SELECT 
        employee_id,
        first_name,
        last_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive member
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh
        ON e.manager_id = eh.employee_id
),
DepartmentSummary AS (
    SELECT 
        department_id,
        AVG(salary) AS avg_salary,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
)

-- Main SELECT statement
SELECT 
    -- Basic columns
    e.employee_id,
    e.first_name || ' ' || e.last_name AS full_name,
    e.hire_date,
    
    -- Subquery in SELECT
    (SELECT COUNT(*) FROM orders WHERE employee_id = e.employee_id) AS total_orders,
    
    -- CASE statement
    CASE 
        WHEN e.salary > (SELECT avg_salary FROM DepartmentSummary WHERE department_id = e.department_id)
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_comparison,
    
    -- Window function
    RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS department_salary_rank,
    
    -- JSON function
    JSON_BUILD_OBJECT('department', d.department_name, 'location', l.city) AS department_info,
    
    -- Aggregate with GROUP BY
    COUNT(p.project_id) AS project_count,
    
    -- COALESCE function
    COALESCE(m.first_name || ' ' || m.last_name, 'No Manager') AS manager_name,
    
    -- Date function
    AGE(CURRENT_DATE, e.hire_date) AS employment_duration,
    
    -- Mathematical expression
    ROUND(e.salary * 1.1, 2) AS proposed_salary
    
FROM employees e
-- INNER JOIN
INNER JOIN departments d
    ON e.department_id = d.department_id
-- LEFT JOIN
LEFT JOIN employees m
    ON e.manager_id = m.employee_id
-- RIGHT JOIN
RIGHT JOIN locations l
    ON d.location_id = l.location_id
-- FULL OUTER JOIN
FULL OUTER JOIN projects p
    ON e.department_id = p.department_id
-- CROSS JOIN
CROSS JOIN company_info ci
-- JOIN with subquery
JOIN (
    SELECT 
        department_id,
        MAX(budget) AS max_budget
    FROM departments
    GROUP BY department_id
) AS dept_budgets
    ON d.department_id = dept_budgets.department_id
    
-- WHERE clause with multiple conditions
WHERE e.hire_date BETWEEN '2010-01-01' AND CURRENT_DATE
    AND e.salary > (SELECT AVG(salary) FROM employees)
    AND EXISTS (
        SELECT 1
        FROM employee_skills es
        WHERE es.employee_id = e.employee_id
            AND es.skill_level = 'Expert'
    )
    
-- GROUP BY with ROLLUP
GROUP BY 
    e.employee_id, 
    full_name, 
    e.hire_date, 
    e.salary, 
    d.department_name, 
    l.city, 
    m.first_name, 
    m.last_name, 
    dept_budgets.max_budget,
    d.department_id
    
-- HAVING clause
HAVING COUNT(p.project_id) > 2
    OR SUM(CASE WHEN p.status = 'Completed' THEN 1 ELSE 0 END) >= 1
    
-- Window function in ORDER BY
ORDER BY 
    RANK() OVER (ORDER BY e.salary DESC),
    e.last_name ASC
    
-- LIMIT and OFFSET
LIMIT 100
OFFSET 0;

-- UNION with another query
UNION

SELECT 
    NULL AS employee_id,
    'TOTAL' AS full_name,
    NULL AS hire_date,
    COUNT(*) AS total_orders,
    NULL AS salary_comparison,
    NULL AS department_salary_rank,
    NULL AS department_info,
    COUNT(project_id),
    NULL AS manager_name,
    NULL AS employment_duration,
    SUM(salary)
FROM employees
WHERE department_id IN (
    SELECT department_id 
    FROM departments 
    WHERE budget > 1000000
);

-- INTERSECT example
INTERSECT

SELECT employee_id 
FROM project_assignments
WHERE EXTRACT(YEAR FROM assignment_date) = 2023;
