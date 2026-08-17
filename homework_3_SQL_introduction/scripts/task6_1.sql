-- Задача 6.1 Для каждого заказа добавить колонку с суммой всех заказов
SELECT order_id, customer_id, item, amount,
		SUM(amount) OVER (PARTITION BY customer_id) AS total_by_customer
FROM orders