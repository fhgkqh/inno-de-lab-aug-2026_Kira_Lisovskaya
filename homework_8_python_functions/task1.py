# Константа
MAX_RENTAL_BATCH_LIMIT = 150.0

# Функция
def calculate_rental_batch(quantity: int, rental_rate: float, discount: float = 0.0) -> tuple[float, bool]:
    """
    Рассчитывает стоимость партии дисков с учетом жанровой скидки и проверяет превышение лимита.

    Args:
        quantity (int): Количество дисков в партии.
        rental_rate (float): Стоимость аренды одного диска.
        discount (float, optional): Скидка в долях (от 0 до 1). По умолчанию 0.0.

    Returns:
        tuple[float, bool]: Кортеж (final_sum, is_limit_exceeded), где
            - final_sum — итоговая стоимость, округлённая до 2 знаков,
            - is_limit_exceeded — True, если final_sum > MAX_RENTAL_BATCH_LIMIT.
    """
    final_sum = quantity * rental_rate * (1 - discount)
    final_sum = round(final_sum, 2)
    is_limit_exceeded: bool = final_sum > MAX_RENTAL_BATCH_LIMIT
    return final_sum, is_limit_exceeded

# Тесты
print("=== ОТЧЕТ ПО ПАРТИЯМ АРЕНДЫ ===")

# Позиционные аргументы
res1 = calculate_rental_batch(30, 2.99)
print(f"Партия 1 (Academy Dinosaur): Сумма {res1[0]}$. Превышение лимита: {res1[1]}")

# Именованные аргументы
res2 = calculate_rental_batch(quantity=40, rental_rate=4.99, discount=0.1)
print(f"Партия 2 (Affair Prejudice): Сумма {res2[0]}$. Превышение лимита: {res2[1]}")

# Позиционные с дефолтным discount
res3 = calculate_rental_batch(10, 1.99)
print(f"Партия 3 (Agent Truman): Сумма {res3[0]}$. Превышение лимита: {res3[1]}")

# Именованные
res4 = calculate_rental_batch(quantity=50, rental_rate=3.5, discount=0.2)
print(f"Партия 4 (African Egg): Сумма {res4[0]}$. Превышение лимита: {res4[1]}")