# Список транзакций, полученных от платежного шлюза
raw_transactions = ["SUCCESS:100", "FAILED:50", "SUCCESS:-10", "SUCCESS:0", "SUCCESS:250", "ERROR:200"]

# Генератор списка для фильтрации транзакций:
filtered = [
    int(t.split(':')[1])          # разбиваем строку по ':', берём вторую часть, преобразуем в int
    for t in raw_transactions     # перебираем все транзакции
    if t.startswith("SUCCESS:")   # оставляем только те, которые начинаются на SUCCESS:
    and int(t.split(':')[1]) > 0  # проверка что сумма больше нуля
]

# Вывод результата
print(f"Очищенные транзакции: {filtered}")