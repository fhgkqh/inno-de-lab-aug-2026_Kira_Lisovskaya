-- Задача 7 Найти клиентов, у которых:
-- 1) как минимум 2 заказа,
-- 2) есть хотя бы одна доставка со статусом 'Delivered'.
-- Вывести full_name, country, total_orders, total_amount.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name,
		c.country,
		COUNT(o.order_id) AS total_orders,
		SUM(o.amount) AS total_amount
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id 
JOIN shippings AS s ON c.customer_id = s.customer 
WHERE s.status = 'Delivered'
GROUP BY c.country, c.first_name, c.last_name
HAVING COUNT(o.order_id) >= 2