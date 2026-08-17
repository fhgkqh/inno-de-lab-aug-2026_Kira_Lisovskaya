-- Задача 1.1 Клиенты из страны 'USA' с возрастом > 25
SELECT first_name, last_name, age, country
FROM customers
WHERE country = 'USA' AND age > 25;