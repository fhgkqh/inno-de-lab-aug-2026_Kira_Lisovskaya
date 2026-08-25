try:
    num1 = float(input("Введите первое число: "))
    num2 = float(input("Введите второе число: "))
    operator = input("Выберите оператор (+, -, *, /): ")

    if operator == '+':
        result = num1 + num2
    elif operator == '-':
        result = num1 - num2
    elif operator == '*':
        result = num1 * num2
    elif operator == '/':
        if num2 == 0:
            print("Делить на ноль нельзя!")
            result = None
        else:
            result = num1 / num2
    else:
        print("Неверный оператор!")
        result = None

    # Вывод результата, если он получен
    if result is not None:
        print(f"Результат: {num1} {operator} {num2} = {result}")

except ValueError:
    print("Введите числа!")