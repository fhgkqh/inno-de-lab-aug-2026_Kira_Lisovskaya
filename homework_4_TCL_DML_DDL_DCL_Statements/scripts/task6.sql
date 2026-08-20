-- 1. Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов
SELECT DISTINCT p.ProjectName
FROM projects AS p
JOIN employeeprojects AS ep ON p.ProjectID = ep.ProjectID
JOIN employees AS e ON ep.EmployeeID = e.EmployeeID
WHERE e.FirstName = 'Bob' AND e.LastName = 'Johnson' AND ep.HoursWorked > 150;

-- 2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'
UPDATE projects
SET Budget = Budget * 1.1
WHERE ProjectID IN (
    SELECT DISTINCT ep.ProjectID
    FROM employeeprojects AS ep
    JOIN employees AS e ON ep.EmployeeID = e.EmployeeID
    WHERE e.Department = 'IT'
);

-- Проверка для части 2
SELECT ProjectID, ProjectName, Budget
FROM projects
ORDER BY ProjectID;

-- 3. Для любого проекта, у которого еще нет EndDate, установить EndDate на один год позже его StartDate
UPDATE projects
SET EndDate = StartDate + INTERVAL '1 year'
WHERE EndDate IS NULL;

-- Проверка для части 3
SELECT ProjectID, ProjectName, StartDate, EndDate
FROM projects
ORDER BY ProjectID;

-- 4. Вставить нового сотрудника и немедленно назначить его на проект 'Website Redesign' с 80 часами,
-- все в рамках одной транзакции. Использовать RETURNING для получения EmployeeID

BEGIN;

-- Вставляем нового сотрудника
WITH new_employee AS (
    INSERT INTO Employees (FirstName, LastName, Department, Salary)
    VALUES ('oleg', 'mongol', 'IT', 70000.00)
    RETURNING EmployeeID
)
-- Назначаем его на проект 'Website Redesign'
INSERT INTO employeeprojects (EmployeeID, ProjectID, HoursWorked)
SELECT
    (SELECT EmployeeID FROM new_employee),
    (SELECT ProjectID FROM projects WHERE ProjectName = 'Website Redesign'),
    80;

COMMIT;

-- Проверка для части 4
SELECT * 
FROM employees 
WHERE FirstName = 'oleg' AND LastName = 'mongol';
SELECT ep.*, p.ProjectName
FROM employeeprojects AS ep
JOIN projects AS p ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID = (
	SELECT EmployeeID
	FROM employees
	WHERE FirstName = 'oleg' AND LastName = 'mongol'
);