-- Рейтинг факультетов по среднему баллу

SELECT
	-- выбор факультета
    ds.Faculty,
    -- средняя оценка (два знака после запятой)
    ROUND(AVG(fsg.Grade), 2) AS AvgGrade,
    -- количество студентов
    COUNT(DISTINCT fsg.StudentKey) AS StudentCount,
    -- процент сдавших
    ROUND(COUNT(CASE WHEN fsg.IsPassed = TRUE THEN 1 END) * 100.0 / COUNT(*), 1) AS PassRate
FROM FactStudentGrades AS fsg
JOIN DimStudent AS ds ON fsg.StudentKey = ds.StudentKey
WHERE fsg.IsRetake = FALSE        -- учитывается без пересдач
GROUP BY ds.Faculty               -- группируем по факультетам
ORDER BY AvgGrade DESC;