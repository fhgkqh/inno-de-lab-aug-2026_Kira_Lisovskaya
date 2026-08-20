-- 1. Создать роль hr_user с паролем
CREATE ROLE hr_user WITH LOGIN PASSWORD 'password123';

-- 2. Дать право SELECT на таблицу Employees
GRANT SELECT ON Employees TO hr_user;

-- 4. дать права INSERT и UPDATE после первых двух тестов
GRANT INSERT, UPDATE ON Employees TO hr_user;