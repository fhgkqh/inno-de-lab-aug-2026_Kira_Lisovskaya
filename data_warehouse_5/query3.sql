SELECT
	-- номер студента
	ds.StudentID,
	-- полное имя
    ds.LastName || ' ' || ds.FirstName AS StudentName,
    -- факультет
    ds.Faculty,
    -- специальность
    ds.Specialization,
    -- статус
    ds.StudentStatus,
    -- средняя оценка
    ROUND(AVG(fsg.Grade), 2) AS AvgGrade,
    -- количество предметов
    COUNT(*) AS SubjectsTaken,
    -- количество несданных предметов
    COUNT(CASE WHEN fsg.IsPassed = FALSE THEN 1 END) AS FailedSubjects,  
    -- количество пересдач
    COUNT(CASE WHEN fsg.IsRetake = TRUE THEN 1 END) AS RetakeCount  
FROM FactStudentGrades AS fsg
JOIN DimStudent AS ds ON fsg.StudentKey = ds.StudentKey
GROUP BY ds.StudentID, ds.LastName, ds.FirstName, ds.Faculty, ds.Specialization, ds.StudentStatus
HAVING AVG(fsg.Grade) < 5.0                                  -- средний балл ниже 5
    OR COUNT(CASE WHEN fsg.IsPassed = FALSE THEN 1 END) > 0  -- или есть несданные предметы
ORDER BY AvgGrade;