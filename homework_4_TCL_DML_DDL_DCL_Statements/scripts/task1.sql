-- 1. Вставить двух новых сотрудников (отдел не 'IT')
INSERT INTO employees (FirstName, LastName, Department, Salary)
VALUES
	('Anastsia', 'Zemleroyka', 'HR', 52000.00),
	('Mr', 'Beast', 'Finance', 67000.00);

-- 2. Выбрать всех сотрудников
SELECT *
FROM employees;

-- 3. Выбрать только FirstName и LastName сотрудников из отдела 'IT'
SELECT FirstName, LastName
FROM employees
WHERE Department = 'IT';

-- 4. Обновить Salary Alice Smith до 65000.00
UPDATE employees
SET Salary = 65000.00
WHERE FirstName = 'Alice' AND LastName = 'Smith';

-- 5. Удалить сотрудника Eve Davis
DELETE FROM employees
WHERE FirstName = 'Eve' AND LastName = 'Davis';

-- 6. Проверить все изменения
SELECT *
FROM employees;