-- 1. Overview of Table Structure
DESCRIBE table_name;  -- MySQL  
PRAGMA table_info(table_name);  -- SQLite  
SELECT column_name, data_type FROM information_schema.columns  
WHERE table_name = 'table_name';  -- PostgreSQL, SQL Server

-- 2. Check Total Rows & Null Counts
SELECT COUNT(*) AS total_rows,  
       COUNT(DISTINCT id) AS unique_rows,  
       SUM(CASE WHEN column_name IS NULL THEN 1 ELSE 0 END) AS null_values  
FROM table_name;

-- 3. Summary Statistics for Numeric Columns
SELECT  
    MIN(numeric_column) AS min_value,  
    MAX(numeric_column) AS max_value,  
    AVG(numeric_column) AS avg_value,  
    STDDEV(numeric_column) AS stddev_value,  
    COUNT(numeric_column) AS non_null_count  
FROM table_name;

-- 4. Detect Duplicate Records
SELECT column_name, COUNT(*) AS count  
FROM table_name  
GROUP BY column_name  
HAVING COUNT(*) > 1;

-- 5. Distribution of Categorical Columns
SELECT column_name, COUNT(*) AS count  
FROM table_name  
GROUP BY column_name  
ORDER BY count DESC  
LIMIT 10;

-- 6. Check Data Skewness (Top Frequent Values)
SELECT column_name, COUNT(*) AS count  
FROM table_name  
GROUP BY column_name  
ORDER BY count DESC  
LIMIT 5;

-- 7. Identify Outliers (Using IQR)
WITH Stats AS (
    SELECT 
        column_name, 
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY column_name) AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY column_name) AS Q3
    FROM table_name
)
SELECT * FROM table_name 
WHERE column_name < (SELECT Q1 - 1.5 * (Q3 - Q1) FROM Stats)  
   OR column_name > (SELECT Q3 + 1.5 * (Q3 - Q1) FROM Stats);
