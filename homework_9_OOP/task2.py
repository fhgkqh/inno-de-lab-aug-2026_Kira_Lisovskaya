from task1 import Trainee    # импорт класса из файла с первмы заданием

class HardworkingTrainee(Trainee):
    """
    За домашнее задание получает 2 балла вместо 1
    """

    def do_homework(self):
        """
        Переопределяет родительский метод: прибавляет 2 балла за ДЗ
        """
        self.score += 2

class AuditTrainee(Trainee):
    """
    Всегда считается прошедшим курс, даже с нулём баллов
    """

    def is_passing(self):
        """
        Переопределяет родительский метод: всегда возвращает True
        """
        return True

class Cohort:
    """
    Хранит список учащихся и может проводить лекции.
    """

    def __init__(self, title: str, trainees=None):
        """
        Создаёт группу с названием и списком учащихся.
        Если список не передан, создаётся новый пустой список
        """
        self.title = title
        # Чтобы у каждой группы был свой отдельный список, а не общий,
        # используется None, а затем создаётся новый список
        if trainees is None:
            self.trainees = []
        else:
            self.trainees = trainees

    def add_trainee(self, trainee):
        """
        Добавляет одного учащегося в группу
        """
        self.trainees.append(trainee)

    def conduct_lecture(self):
        """
        Вызывает метод visit_lecture() у каждого учащегося в группах
        """
        for student in self.trainees:
            student.visit_lecture()

    def get_passing_students(self):
        """
        Возвращает список учащихся, которые прошли курс
        """
        result = []
        for student in self.trainees:
            if student.is_passing():
                result.append(student)
        return result

# Тесты
# Создание разных типов учащихся
std_trainee = Trainee("Алексей", "Смирнов", score=8, passing_grade=10)
hard_trainee = HardworkingTrainee("Елена", "Петрова", score=8, passing_grade=10)
audit_trainee = AuditTrainee("Дмитрий", "Сидоров", score=0, passing_grade=10)

# Создание группы и добавление студентов
cohort = Cohort("Python Advanced")
cohort.add_trainee(std_trainee)
cohort.add_trainee(hard_trainee)
cohort.add_trainee(audit_trainee)

# Проведение лекции - всем +1
cohort.conduct_lecture()

# Трудоголик делает домашку - получает +2
hard_trainee.do_homework()

# Список успешно прошедших
passing = cohort.get_passing_students()

print(f"=== УСПЕВАЕМОСТЬ ГРУППЫ '{cohort.title}' ===")
for student in cohort.trainees:
    print(f"{student.name} {student.surname} | Баллы: {student.score} | Проходит: {student.is_passing()}")

print("\nУспешно зачислены на следующий модуль:")
for student in passing:
    print(f"- {student.name} {student.surname}")