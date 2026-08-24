try:
    length = float(input("Введите длину прямоугольника: "))
    width = float(input("Введите ширину прямоугольника: "))

    # Проверка на корректность ввода
    if length > 0 and width > 0:
        S = length * width
        print(f"Площадь прямоугольника: {S}")
    else:
        print("Стороны должны быть положительными")
except ValueError:  # Если было введено не числовое значение
    print("Введите число!")