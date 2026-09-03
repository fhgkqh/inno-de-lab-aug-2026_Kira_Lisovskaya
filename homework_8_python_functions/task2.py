import time
from typing import Any, Callable, List, Dict, Union

# Константы
PERFORMANCE_LOG_PREFIX = "[PERF_LOG]"
TIME_DECIMALS = 8

# Декоратор
def performance_logger(func: Callable) -> Callable:
    """
    Декоратор для фиксирования времени выполнения функции.

    Args:
        func (Callable): Функция.

    Returns:
        Callable: Обёрнутая функция, которая выводит время выполнения.
    """
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        start = time.perf_counter()
        result = func(*args, **kwargs)
        elapsed = time.perf_counter() - start
        print(f"{PERFORMANCE_LOG_PREFIX} Функция '{func.__name__}' выполнена за {elapsed:.{TIME_DECIMALS}f} сек.")
        return result
    return wrapper

# Основная функция
@performance_logger
def get_sorted_report(data: List[Dict[str, Union[str, float]]]) -> List[Dict[str, Union[str, float]]]:
    """
        Сортирует список словарей по ключу 'total_sales' по убыванию с помощью lambda.

        Args:
            data (List[Dict[str, Union[str, float]]]): Список словарей с категориями и выручкой.

        Returns:
            List[Dict[str, Union[str, float]]]: Отсортированный список.
        """
    return sorted(data, key=lambda item: item["total_sales"], reverse=True)

# Тесты
print("=== ТЕСТИРОВАНИЕ ПРОИЗВОДИТЕЛЬНОСТИ ===\n")

# Набор 1
data1 = [
    {"category": "Action", "total_sales": 4311.85},
    {"category": "Animation", "total_sales": 4656.30},
    {"category": "Children", "total_sales": 3655.55}
]
print("--- ТЕСТ 1 ---")
sorted1 = get_sorted_report(data1)
print("Топ категорий по выручке:")
for idx, item in enumerate(sorted1, 1):
    print(f"{idx}. {item['category']}: {item['total_sales']}")
print()

# Набор 2
data2 = [
    {"category": "Classics", "total_sales": 1200.10},
    {"category": "Comedy", "total_sales": 4000.00},
    {"category": "Documentary", "total_sales": 4000.00}
]
print("--- ТЕСТ 2 ---")
sorted2 = get_sorted_report(data2)
print("Топ категорий по выручке:")
for idx, item in enumerate(sorted2, 1):
    print(f"{idx}. {item['category']}: {item['total_sales']}")
print()

# Набор 3
data3 = [
    {"category": "Drama", "total_sales": 500.00}
]
print("--- ТЕСТ 3 ---")
sorted3 = get_sorted_report(data3)
print("Топ категорий по выручке:")
for idx, item in enumerate(sorted3, 1):
    print(f"{idx}. {item['category']}: {item['total_sales']}")