-- 1. Создание функции CalculateAnnualBonus, которая:
-- Принимает employee_id (для идентификации) и salary (для расчёта)
-- Возвращает 10% от переданной зарплаты
CREATE OR REPLACE FUNCTION CalculateAnnualBonus(p_employee_id INT, p_salary DECIMAL)
RETURNS DECIMAL AS $$
BEGIN
	-- Возвращаем 10% от зарплаты
	RETURN p_salary * 0.1;
END;
$$ LANGUAGE plpgsql;

-- 2. Использование функции для каждого сотрудника
-- Выводим ID, имя, фамилию, зарплату и рассчитанный бонус
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CalculateAnnualBonus(EmployeeID, Salary) AS AnnualBonus
FROM employees
ORDER BY EmployeeID;

-- 3. Создание IT_Department_View
-- Показывает только сотрудников из отдела 'IT'
CREATE VIEW IT_Department_View
AS
	SELECT 
	    EmployeeID,
	    FirstName,
	    LastName,
	    Salary
	FROM employees
	WHERE Department = 'IT';

-- 4. Выбор данных из созданного представления
SELECT * FROM IT_Department_View;