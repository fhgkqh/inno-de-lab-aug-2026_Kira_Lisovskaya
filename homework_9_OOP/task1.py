class Trainee:
    """
    Класс для учёта успеваемости стажёра.
    """
    def __init__(self, name: str, surname: str, score: int = 0, passing_grade: int = 10):
        """
        Инициализация объекта класса. Создаёт нового стажёра. Имя и фамилия обязательны,
        начальные баллы и проходной порог можно задать (по умолчанию 0 и 10)

        :param name: Имя стажера
        :param surname: Фамилия стажера
        :param score: Баллы (по умолчанию 0)
        :param passing_grade: Минимальные баллы для прохождения курса
        """
        self.name = name          # имя доступно для чтения и изменения
        self.surname = surname    # фамилия тоже
        self.passing_grade = passing_grade  # проходной балл тоже
        self.__score = score      # приватный уровень доступа

    @property
    def score(self):
        """
        Возвращает текущее значение баллов
        """
        return self.__score

    @score.setter
    def score(self, value: int):
        """
        Устанавливает новое значение баллов. При этом проверяется:
        - значение должно быть целым числом
        - значение не должно быть отрицательным
        Если проверка не пройдена, вызывается ошибка ValueError.
        """
        if not isinstance(value, int):
            raise ValueError(f"Ожидалось целове число")
        if value < 0:
            raise ValueError("Баллы не могут быть меньше нуля")
        self.__score = value

    # Методы, изменяющие баллы, используют свойство score,
    # поэтому проверка срабатывает автоматически.

    def do_homework(self):
        """
        Увеличивает баллы на 1 за выполненное домашнее задание
        """
        self.score += 1

    def miss_homework(self):
        """
        Уменьшает баллы на 1 за пропущенное домашнее задание
        """
        self.score -= 1

    def visit_lecture(self):
        """
        Увеличивает баллы на 1 за посещение лекции
        """
        self.score += 1

    def miss_lecture(self):
        """
        Уменьшает баллы на 1 за пропуск лекции
        """
        self.score -= 1

    def is_passing(self):
        """
        Проверяет, достиг ли стажёр проходного балла.
        Возвращает True, если баллов >= проходного порога, иначе False
        """
        return self.score >= self.passing_grade

# Тесты
print("=== ПРОВЕРКА УСПЕВАЕМОСТИ СТАЖЕРА ===")
trainee = Trainee(name="Иван", surname="Иванов", score=9, passing_grade=10)

trainee.do_homework()
print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}")

trainee.miss_lecture()
print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}")

try:
    trainee.score = -5
except ValueError as e:
    print(f"Ошибка: {e}")