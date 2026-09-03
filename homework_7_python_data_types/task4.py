# Список ролей, переданный в запросе на авторизацию (содержит повторы)
requested_roles = ["guest", "developer", "guest", "admin", "developer", "guest"]

# Набор обязательных административных ролей
required_admin_roles = {"admin", "security_officer", "audit_manager"}

# Преобразуем список запрошенных ролей во множество для удаления дубликатов
unique_roles = set(requested_roles)

# Определяем роли, присутствующие одновременно в уникальных и обязательных
common_roles = unique_roles & required_admin_roles

# Находим недостающие администротивные роли
missing_roles = required_admin_roles - unique_roles

# Проверяем наличие роли "security_officer" в дедуплицированном множестве
has_security_officer = "security_officer" in unique_roles

# Вывод результатов
print(f"Уникальные запрошенные роли: {unique_roles}")
print(f"Общие административные роли: {common_roles}")
print(f"Недостающие административные роли: {missing_roles}")
print(f"Наличие роли security_officer в запросе: {has_security_officer}")