import pprint      # импортирую, чтобы в конце словарь выводился не в одну строку

# Поток данных телеметрии от серверов кластера
system_telemetry = [
    ("srv_01", 12.5, 64, "online"),
    ("srv_02", 85.0, 92, "online"),
    ("srv_03", 0.0, 0, "offline"),
    ("srv_04", 45.2, 78, "online"),
    ("srv_05", 95.1, 99, "online")
]

# Распаковываем элементы кортежей, фильтруем только онлайн-серверы,
# формируем список имен активных узлов и списки нагрузок для расчётов,
# используем распаковку в заголовке цикла for
active_nodes = []
cpu_loads = []
ram_usages = []

for node_name, cpu_load, ram_usage, status in system_telemetry:
    if status == "online":
        active_nodes.append(node_name)
        cpu_loads.append(cpu_load)
        ram_usages.append(ram_usage)

# Рассчитываем итоговые метрики с помощью встроенных агрегирующих функций
active_count = len(active_nodes)
avg_cpu = sum(cpu_loads) / active_count if active_count > 0 else 0.0
max_ram = max(ram_usages) if ram_usages else 0

# Помещаем результаты в итоговый вложенный словарь
report = {
    "active_nodes_count": active_count,
    "metrics": {
        "average_cpu": round(avg_cpu, 2),   # округление на месте
        "max_ram": max_ram
    }
}

# Вывод резулььтатов
print(f"Активные узлы в сети: {active_nodes}")
print("Итоговый отчет телеметрии:")
pprint.pprint(report, indent=2, width=40)      # indent добавляет отступы для вложенных структур, width ограничивает ширину строки