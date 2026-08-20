-- Таблица измерений: Студенты
CREATE TABLE DimStudent (
    StudentKey       INTEGER PRIMARY KEY,
    StudentID        INTEGER UNIQUE NOT NULL,
    FirstName        VARCHAR(50) NOT NULL,
    LastName         VARCHAR(50) NOT NULL,
    Gender           CHAR(1) CHECK (Gender IN ('M', 'F')),
    DateOfBirth      DATE,
    EnrollmentDate   DATE,
    StudentStatus    VARCHAR(20) DEFAULT 'Активен',
    ScholarshipType  VARCHAR(30),
    GroupName        VARCHAR(20),
    Year             SMALLINT CHECK (Year BETWEEN 1 AND 6),
    Faculty          VARCHAR(150),
    Specialization   VARCHAR(200),
    EducationLevel   VARCHAR(30),
    StudyForm        VARCHAR(30)
);

-- Данные студентов
INSERT INTO DimStudent (StudentKey, StudentID, FirstName, LastName, Gender, DateOfBirth, EnrollmentDate, StudentStatus, ScholarshipType, GroupName, Year, Faculty, Specialization, EducationLevel, StudyForm)
VALUES
(1, 101, 'Иван', 'Петров', 'M', '2000-05-12', '2022-09-01', 'Активен', 'Государственная', 'АИС-101', 3, 'Факультет автоматизированных и информационных систем', 'Информационные системы и технологии (Проектирование и разработка ПО)', 'Бакалавриат', 'Очная'),
(2, 102, 'Мария', 'Иванова', 'F', '2001-02-20', '2022-09-01', 'Активен', 'Именная', 'АИС-101', 3, 'Факультет автоматизированных и информационных систем', 'Информатика и технологии программирования', 'Бакалавриат', 'Очная'),
(3, 103, 'Алексей', 'Сидоров', 'M', '1999-11-03', '2021-09-01', 'Активен', 'Без стипендии', 'МС-201', 4, 'Машиностроительный факультет', 'Технология машиностроения, металлорежущие станки и инструменты', 'Бакалавриат', 'Очная'),
(4, 104, 'Елена', 'Кузнецова', 'F', '2002-07-15', '2023-09-01', 'Активен', 'Государственная', 'ЭН-101', 2, 'Энергетический факультет', 'Электроэнергетика и электротехника', 'Бакалавриат', 'Очная'),
(5, 105, 'Дмитрий', 'Смирнов', 'M', '2000-09-25', '2022-09-01', 'Активен', 'Именная', 'МТ-101', 3, 'Механико-технологический факультет', 'Автомобили, тракторы, мобильные и технологические комплексы', 'Бакалавриат', 'Очная');

-- Таблица измерений: Учебные предметы
CREATE TABLE DimSubject (
    SubjectKey       INTEGER PRIMARY KEY,
    SubjectID        INTEGER UNIQUE NOT NULL,
    SubjectName      VARCHAR(100) NOT NULL,
    Credits          DECIMAL(5,2),
    SubjectType      VARCHAR(30),
    SubjectArea      VARCHAR(50),
    DifficultyLevel  VARCHAR(20),
    AcademicHours    INTEGER
);

-- Данные предметов
INSERT INTO DimSubject (SubjectKey, SubjectID, SubjectName, Credits, SubjectType, SubjectArea, DifficultyLevel, AcademicHours)
VALUES
(1, 201, 'Математический анализ', 6, 'Обязательный', 'Технические', 'Продвинутый', 120),
(2, 202, 'Физика', 5, 'Обязательный', 'Технические', 'Средний', 100),
(3, 203, 'Программирование', 5, 'Обязательный', 'Технические', 'Средний', 100),
(4, 204, 'История', 3, 'По выбору', 'Гуманитарные', 'Начальный', 60);

-- Таблица измерений: Преподаватели
CREATE TABLE DimProfessor (
    ProfessorKey     INTEGER PRIMARY KEY,
    ProfessorID      INTEGER UNIQUE NOT NULL,
    FirstName        VARCHAR(50) NOT NULL,
    LastName         VARCHAR(50) NOT NULL,
    Department       VARCHAR(100),
    Faculty          VARCHAR(150),
    AcademicTitle    VARCHAR(50),
    AcademicDegree   VARCHAR(50),
    Seniority        INTEGER,
    IsHeadOfDepartment BOOLEAN DEFAULT FALSE
);

-- Данные преподавателей
INSERT INTO DimProfessor (ProfessorKey, ProfessorID, FirstName, LastName, Department, Faculty, AcademicTitle, AcademicDegree, Seniority, IsHeadOfDepartment)
VALUES
(1, 301, 'Сергей', 'Васильев', 'Высшей математики', 'Факультет автоматизированных и информационных систем', 'Профессор', 'Доктор наук', 25, TRUE),
(2, 302, 'Ольга', 'Петрова', 'Физики', 'Энергетический факультет', 'Доцент', 'Кандидат наук', 12, FALSE),
(3, 303, 'Андрей', 'Иванов', 'Программирования', 'Факультет автоматизированных и информационных систем', 'Старший преподаватель', 'Без степени', 8, FALSE);

-- Таблица измерений: Время
CREATE TABLE DimTime (
    TimeKey          INTEGER PRIMARY KEY,
    FullDate         DATE NOT NULL,
    Year             INTEGER NOT NULL,
    Semester         SMALLINT CHECK (Semester IN (1, 2)),
    AcademicYear     VARCHAR(9),
    MonthName        VARCHAR(20),
    Quarter          SMALLINT,
    DayOfWeek        SMALLINT
);

-- Данные семестров
INSERT INTO DimTime (TimeKey, FullDate, Year, Semester, AcademicYear, MonthName, Quarter, DayOfWeek)
VALUES
(202501, '2025-01-15', 2025, 1, '2024-2025', 'Январь', 1, 3),
(202502, '2025-06-15', 2025, 2, '2024-2025', 'Июнь', 2, 7);

-- Таблица измерений: Тип оценки
CREATE TABLE DimGradeType (
    GradeTypeKey     INTEGER PRIMARY KEY,
    GradeTypeID      INTEGER UNIQUE NOT NULL,
    GradeTypeName    VARCHAR(50) NOT NULL,
    AssessmentMethod VARCHAR(50),
    Weight           DECIMAL(3,2),
    IsFinal          BOOLEAN DEFAULT FALSE
);

-- Данные типов оценок
INSERT INTO DimGradeType (GradeTypeKey, GradeTypeID, GradeTypeName, AssessmentMethod, Weight, IsFinal)
VALUES
(1, 401, 'Экзамен', 'Тестирование', 1.0, TRUE),
(2, 402, 'Зачёт', 'Устный ответ', 0.5, FALSE);

-- Таблица фактов: Оценки студентов
-- Одна запись = оценка студента по предмету в семестре
CREATE TABLE FactStudentGrades (
    GradeFactKey     BIGINT PRIMARY KEY,
    StudentKey       INTEGER NOT NULL,
    SubjectKey       INTEGER NOT NULL,
    ProfessorKey     INTEGER NOT NULL,
    TimeKey          INTEGER NOT NULL,
    GradeTypeKey     INTEGER NOT NULL,
    Grade            DECIMAL(5,2) CHECK (Grade BETWEEN 0 AND 10),
    IsPassed         BOOLEAN,
    IsRetake         BOOLEAN DEFAULT FALSE,
    AttemptNumber    SMALLINT DEFAULT 1,
    AttendanceRate   DECIMAL(5,2),
    BonusPoints      DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (StudentKey)   REFERENCES DimStudent(StudentKey),
    FOREIGN KEY (SubjectKey)   REFERENCES DimSubject(SubjectKey),
    FOREIGN KEY (ProfessorKey) REFERENCES DimProfessor(ProfessorKey),
    FOREIGN KEY (TimeKey)      REFERENCES DimTime(TimeKey),
    FOREIGN KEY (GradeTypeKey) REFERENCES DimGradeType(GradeTypeKey)
);

-- Данные оценок студентов
INSERT INTO FactStudentGrades (
    GradeFactKey, StudentKey, SubjectKey, ProfessorKey, TimeKey, GradeTypeKey,
    Grade, IsPassed, IsRetake, AttemptNumber, AttendanceRate, BonusPoints
)
VALUES
-- 1-й семестр
(1,  1, 1, 1, 202501, 1, 8.5, TRUE,  FALSE, 1, 92.5, 1.0),
(2,  1, 2, 2, 202501, 1, 7.0, TRUE,  FALSE, 1, 85.0, 0.0),
(3,  1, 3, 3, 202501, 2, 9.0, TRUE,  FALSE, 1, 95.0, 2.0),
(4,  2, 1, 1, 202501, 1, 9.0, TRUE,  FALSE, 1, 98.0, 1.5),
(5,  2, 2, 2, 202501, 1, 6.5, TRUE,  FALSE, 1, 78.0, 0.0),
(6,  2, 3, 3, 202501, 2, 8.0, TRUE,  FALSE, 1, 90.0, 1.0),
(7,  3, 1, 1, 202501, 1, 5.0, FALSE, FALSE, 1, 60.0, 0.0),
(8,  3, 2, 2, 202501, 1, 4.5, FALSE, FALSE, 1, 55.0, 0.0),
(9,  3, 4, 2, 202501, 1, 7.5, TRUE,  FALSE, 1, 80.0, 0.0),
(10, 4, 1, 1, 202501, 1, 6.0, TRUE,  FALSE, 1, 70.0, 0.5),
(11, 4, 2, 2, 202501, 1, 8.0, TRUE,  FALSE, 1, 88.0, 0.0),
(12, 4, 3, 3, 202501, 2, 7.5, TRUE,  FALSE, 1, 82.0, 0.0),
(13, 5, 1, 1, 202501, 1, 4.0, FALSE, TRUE,  2, 50.0, 0.0),
(14, 5, 3, 3, 202501, 2, 6.0, TRUE,  FALSE, 1, 72.0, 0.0),
(15, 5, 4, 2, 202501, 1, 5.5, TRUE,  FALSE, 1, 65.0, 0.0),

-- 2-й семестр
(16, 1, 1, 1, 202502, 1, 9.0, TRUE, FALSE, 1, 96.0, 0.5),
(17, 1, 2, 2, 202502, 1, 8.0, TRUE, FALSE, 1, 90.0, 0.0),
(18, 2, 1, 1, 202502, 1, 8.5, TRUE, FALSE, 1, 94.0, 1.0),
(19, 2, 3, 3, 202502, 2, 9.5, TRUE, FALSE, 1, 97.0, 2.0),
(20, 3, 1, 1, 202502, 1, 5.5, TRUE, FALSE, 1, 65.0, 0.0),
(21, 3, 2, 2, 202502, 1, 6.0, TRUE, FALSE, 1, 70.0, 0.0),
(22, 4, 1, 1, 202502, 1, 7.0, TRUE, FALSE, 1, 78.0, 0.0);
