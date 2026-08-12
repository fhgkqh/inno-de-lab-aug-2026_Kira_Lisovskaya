-- Задача 2.2 Вывести список доставок со статусом и именем клиента
SELECT s.status, c.first_name, c.last_name
FROM shippings AS s
JOIN customers AS c ON s.customer = c.customer_id 