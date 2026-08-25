try:
    C_temperature = float(input("Введите температуру в градусах Цельсия: "))

    # Проверка на корректность ввода
    if C_temperature >= -273.15:
        F_temperature = C_temperature * 9 / 5 + 32
        print(f"{C_temperature}°C это {F_temperature}°F")
    else:
        print("Вы ввели неправильное значение температуры")
except ValueError:       # Если было введено не числовое значение
    print("Введите число!")