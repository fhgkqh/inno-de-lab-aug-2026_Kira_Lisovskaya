# Исходная необработанная строка из источника данных
raw_user_record = " 10827 ; aLeXanDer_vLaDimiRov ; mInSk ; ACTIVE "

# Разбиваем строку по разделителю ';'
parts = raw_user_record.split(';')

# Убираем пробелы возле слов
cleaned_parts = []
for part in parts:
    cleaned_parts.append(part.strip())

# Дописываем UID- перед id пользователя
user_id = f"UID-{cleaned_parts[0]}"

# Преобразуем имя пользователя (замена "_" на пробел, приводим слово к правильному регистру)
user_name = cleaned_parts[1].replace('_', ' ').title()

# Записываем название города верхнним регистром
city = cleaned_parts[2].upper()

# Записываем статус пользователя нижним регистром
status = cleaned_parts[3].lower()

# Вывод нормализованной строки
processed = [user_id, user_name, city, status]
result = " | ".join(processed)
print(f"Нормализованная запись: {result}")