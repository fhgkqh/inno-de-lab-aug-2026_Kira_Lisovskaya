-- Задача 2.1 Получить список заказов вместе с именем клиента
SELECT c.first_name, c.last_name, o.item, o.amount
FROM orders AS o 
JOIN customers AS c ON o.customer_id = c.customer_id 