-- Задача 3.2 Для каждого товара (item) подсчитать количество заказов и среднюю сумму (avg_amount)
SELECT item, COUNT(*) AS count, AVG(amount) AS avg_amount 
FROM orders
GROUP BY item