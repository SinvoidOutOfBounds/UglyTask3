SELECT PATINDEX('%[0-9]%',data.string)
FROM data
WHERE ISNUMERIC(SUBSTRING(data.string, PATINDEX('%[0-9]%',data.string), CHARINDEX(' ', CONCAT(SUBSTRING (data.string, PATINDEX('%[0-9]%',data.string), LEN(data.string) - PATINDEX('%[0-9]%',data.string)+1),' '))-PATINDEX('%[0-9]%',CONCAT(SUBSTRING (data.string, PATINDEX('%[0-9]%',data.string), LEN(data.string) - PATINDEX('%[0-9]%',data.string)+1),' ')))) = 1
	AND RIGHT(data.string, LEN(SUBSTRING(data.string, PATINDEX('%[0-9]%',data.string), CHARINDEX(' ', CONCAT(SUBSTRING (data.string, PATINDEX('%[0-9]%',data.string), LEN(data.string) - PATINDEX('%[0-9]%',data.string)+1),' '))-PATINDEX('%[0-9]%',CONCAT(SUBSTRING (data.string, PATINDEX('%[0-9]%',data.string), LEN(data.string) - PATINDEX('%[0-9]%',data.string)+1),' ')))))
	<> SUBSTRING(data.string, PATINDEX('%[0-9]%',data.string), CHARINDEX(' ', CONCAT(SUBSTRING (data.string, PATINDEX('%[0-9]%',data.string), LEN(data.string) - PATINDEX('%[0-9]%',data.string)+1),' '))-PATINDEX('%[0-9]%',CONCAT(SUBSTRING (data.string, PATINDEX('%[0-9]%',data.string), LEN(data.string) - PATINDEX('%[0-9]%',data.string)+1),' ')))
-- Отсутствие знания о том, где заканчивается число сильно увеличивает проверяемую на условия подстроку
-- ISNUMERIC проверяет, что после числа не идёт буква
-- RIGHT <> В этом условии проверяется, что число не находится в конце строки.
