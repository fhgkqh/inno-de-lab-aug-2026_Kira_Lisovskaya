from typing import Any, Optional, Tuple

# Константы
DEFAULT_RETURN_INDEX_BASE = 10.0

# Функция
def calculate_overdue_fine(days_overdue: Any, fine_rate: float) -> Optional[Tuple[float, float]]:
    """
    Безопасно рассчитывает штраф и индекс оборачиваемости при возврате фильма.

    Args:
        days_overdue (Any): Количество дней просрочки (может быть числом, строкой или списком).
        fine_rate (float): Штраф за день.

    Returns:
        Optional[Tuple[float, float]]: Кортеж (total_fine, return_index) при успехе,
                                        иначе None.

    Обрабатываемые исключения:
        TypeError – если days_overdue не преобразуется в float.
        ValueError – если строка не является числом.
        ZeroDivisionError – если days_overdue == 0.
    """
    try:
        numeric_days = float(days_overdue)
        total_fine = numeric_days * fine_rate
        return_index = DEFAULT_RETURN_INDEX_BASE / numeric_days
        print(f"Итоговый штраф: {total_fine}$ | Индекс: {return_index}")  # теперь print здесь
        return total_fine, return_index
    except TypeError as e:
        print(f"[ОШИБКА ТИПА] Невозможно преобразовать дни в число: {e}")
        return None
    except ValueError as e:
        print(f"[ОШИБКА ЗНАЧЕНИЯ] Невозможно преобразовать дни в число: {e}")
        return None
    except ZeroDivisionError:
        print("[ОШИБКА ДЕЛЕНИЯ НА НОЛЬ] Возврат без просрочки: float division by zero")
        return None
    finally:
        print("--- Проверка транзакции возврата завершена ---")

# Тесты
print("=== ПРОВЕРКА ВОЗВРАТОВ ===")

# Успешный расчёт
print("\nФильм: 'Matrix' |", end=" ")
calculate_overdue_fine(5, 1.5)

# ValueError
print("\nФильм: 'Inception' |", end=" ")
calculate_overdue_fine("пять", 2.0)

# ZeroDivisionError
print("\nФильм: 'Avatar' |", end=" ")
calculate_overdue_fine(0, 2.5)

# TypeError
print("\nФильм: 'Interstellar' |", end=" ")
calculate_overdue_fine([3], 3.0)