-- Средний балл по вузу

SELECT
    ROUND(AVG(fsg.Grade), 2) AS AvgGrade,              -- средняя оценка по всему вузу
    COUNT(*) AS TotalGrades,                           -- общее количество оценок
    COUNT(DISTINCT fsg.StudentKey) AS TotalStudents    -- общее количество студентов
FROM FactStudentGrades AS fsg                          -- таблица фактов
WHERE fsg.IsRetake = FALSE;                            -- только первая попытка