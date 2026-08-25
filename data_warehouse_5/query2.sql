-- Динамика успеваемости по семестрам

SELECT
	-- учебный год
    dt.AcademicYear,
    -- семестр
    dt.Semester,
    -- средняя оценка
    ROUND(AVG(fsg.Grade), 2) AS AvgGrade,
    -- процент сдавших
    ROUND(COUNT(CASE WHEN fsg.IsPassed = TRUE THEN 1 END) * 100.0 / COUNT(*), 1) AS PassRate
FROM FactStudentGrades AS fsg
JOIN DimTime AS dt ON fsg.TimeKey = dt.TimeKey 
WHERE fsg.IsRetake = FALSE                             -- учиывается без пересдач
GROUP BY dt.AcademicYear, dt.Semester                  -- группируем по семестрам
ORDER BY dt.AcademicYear, dt.Semester;
