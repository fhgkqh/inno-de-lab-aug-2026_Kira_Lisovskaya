try:
    number = int(input("Введите целое число: "))

    if number % 2 == 0:
        print(f"Число {number} - четное")
    else:
        print(f"Число {number} - нечетное")
except ValueError:        # Если было введено не числовое значение
    print("Введите целое число!")