-- 1. Увеличить Salary всех сотрудников в отделе 'HR' на 10%
UPDATE employees
SET Salary = Salary*1.1
WHERE Department = 'HR';

-- 2. Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'
UPDATE employees 
SET Department = 'Senior IT'
WHERE Salary > 70000.00;

-- 3. Удалить всех сотрудников, которые не назначены ни на один проект (используем NOT EXISTS)
DELETE FROM employees AS e
WHERE NOT EXISTS (
    SELECT 1
    FROM employeeprojects AS ep
    WHERE ep.EmployeeID = e.EmployeeID
);

-- 4. В рамках одной транзакции, вставить новый проект и назначить на него двух существующих сотрудников
-- с определенным количеством HoursWorked в EmployeeProjects.
BEGIN;

INSERT INTO projects (ProjectName, Budget, StartDate, EndDate)
VALUES ('project', 120000.00, '2026-01-01', '2026-10-15');

INSERT INTO employeeprojects (employeeid, projectid, hoursworked)
VALUES
  (2, (SELECT projectid FROM projects WHERE projectname = 'project'), 100),
  (4, (SELECT projectid FROM projects WHERE projectname = 'project'), 135)
ON CONFLICT (employeeid, projectid) DO NOTHING;

COMMIT;