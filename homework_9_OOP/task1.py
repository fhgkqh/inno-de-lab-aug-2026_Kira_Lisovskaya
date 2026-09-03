class Trainee:
    """
    Класс для учёта успеваемости стажёра.
    """
    def __init__(self, name: str, surname: str, score: int = 0, passing_grade: int = 10) -> None:
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
    def score(self) -> int:
        """
        Возвращает текущее значение баллов
        """
        return self.__score

    @score.setter
    def score(self, value: int) -> None:
        """
        Устанавливает новое значение баллов. При этом проверяется:
        - значение должно быть целым числом
        - значение не должно быть отрицательным
        Если проверка не пройдена, вызывается ошибка ValueError.
        """
        if not isinstance(value, int):
            raise ValueError(f"Expected value of type int, got {type(value)}")
        if value < 0:
            raise ValueError("The score shouldn't be less than 0!")
        self.__score = value

    # Методы, изменяющие баллы, используют свойство score,
    # поэтому проверка срабатывает автоматически.

    def do_homework(self) -> None:
        """Increases score by 1"""
        self.score += 1

    def miss_homework(self) -> None:
        """Decreases score by 1"""
        self.score -= 1

    def visit_lecture(self) -> None:
        """Increases score by 1"""
        self.score += 1

    def miss_lecture(self) -> None:
        """Decreases score by 1"""
        self.score -= 1

    def is_passing(self) -> bool:
        """
        Проверяет, достиг ли стажёр проходного балла.
        Возвращает True, если баллов >= проходного порога, иначе False
        """
        return self.score >= self.passing_grade

# Тесты
if __name__ == "__main__":
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