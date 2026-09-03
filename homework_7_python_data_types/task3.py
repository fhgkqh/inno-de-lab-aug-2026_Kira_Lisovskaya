# Конфигурационный словарь, полученный от сервиса инициализации
db_config = {
    "connection": {
        "host": "production-db.internal",
        "port": 5432,
        "user": "postgres"
    }
}

# Извлекаем вложенный словарь
conn = db_config["connection"]

# Извлекаем значения host и port, используя .get с дефолтными значениями
host = conn.get("host", "localhost")
port = conn.get("port", 5432)

# Проверяем налиичие ключа ssl_settings и его параметра ssl_mode
# если не ssl_mode, то переменная примет дефолтное значение
ssl_mode = conn.get("ssl_settings", {}).get("ssl_mode", "verify-full")

# Изменяем значение пользователя на "admin"
conn["user"] = "admin"

# Добавляем новый параметр max_connections со значением 100
conn["max_connections"] = 100

# Выводим обновленное содержимое словаря connection
print(f"SSL Mode: {ssl_mode}")
print("Параметры соединения:")
for key, value in conn.items():
    print(f"* {key}: {value}")
