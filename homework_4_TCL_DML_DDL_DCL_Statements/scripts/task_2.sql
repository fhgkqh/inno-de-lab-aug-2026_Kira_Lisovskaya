-- 1. Создать таблицу Departments
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);

-- 2. Добавить столбец Email в Employees
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);

-- 3. Заполнить Email уникальными значениями
UPDATE Employees SET Email = 
    LOWER(FirstName || '.' || LastName || (EmployeeID) || '@gmail.com');

-- 4. Добавить ограничение UNIQUE на Email
ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (Email);

-- 5. Переименовать столбец Location в Departments в OfficeLocation
ALTER TABLE Departments RENAME COLUMN Location TO OfficeLocation;

-- проверить структуру
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'employees' OR table_name = 'departments'
ORDER BY table_name, ordinal_position;

-- вывод таблицы с email
SELECT *
FROM employees