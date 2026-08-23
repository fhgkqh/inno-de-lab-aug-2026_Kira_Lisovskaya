import random

# Генерируем число от 1 до 20
secret = random.randint(1, 20)
attempts = 5

print("Я загадал число от 1 до 20. У тебя 5 попыток!")

while attempts > 0:
    print(f"\nОсталось попыток: {attempts}")
    try:
        guess = int(input("Введите число: "))
    except ValueError:
        print("Введите целое число!")
        continue     # чтобы не тратить попытку на некорректный ввод

    if guess == secret:
        print("Ты угадал! Отличная работа.")
        break    # выход из цикла при победе
    elif guess < secret:
        print("Слишком мало!")
    else:
        print("Слишком много!")

    attempts -= 1

# Если попытки закончились
else:
    print(f"Попытки закончились. Было загадано число {secret}.")