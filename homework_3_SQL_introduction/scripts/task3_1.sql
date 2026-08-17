-- Задача 3.1 Подсчитать количество клиентов в каждой стране
SELECT country, COUNT(*) AS count
FROM customers
GROUP BY country