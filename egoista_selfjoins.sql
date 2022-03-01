-- Egoísta (Selfish): Selfjoins
-- Join con la propia tabla

-- Doy por supuesto que el tutor id es otro alumno y quiero saber quien es.

SELECT a.nombre AS nombre_alumno,
		a.apellido AS apellido_alumno,
		t.nombre AS nombre_tutor,
		t.apellido AS apellido_tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS T 
	ON a.tutor_id = t.id;
	
-- Hago lo mismo pero concetenando nombre y apellido

SELECT CONCAT( a.nombre, ' ', a.apellido) AS alumno,
		CONCAT( t.nombre, ' ', t.apellido) AS tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS T 
	ON a.tutor_id = t.id;

-- Veo 10 tutores con mayor cant de alumnos ordenamos de mayor a menor

SELECT CONCAT( t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS T 
	ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10;

-- Reto: promedio general de alumnos por tutor

SELECT AVG(alumnos_por_tutor)
FROM (
	SELECT CONCAT( t.nombre, ' ', t.apellido) AS tutor,
			COUNT(*) AS alumnos_por_tutor
	FROM platzi.alumnos AS a
		INNER JOIN platzi.alumnos AS T 
		ON a.tutor_id = t.id
	GROUP BY tutor
	ORDER BY alumnos_por_tutor DESC
) AS tabla_alumnos_por_tutor;
