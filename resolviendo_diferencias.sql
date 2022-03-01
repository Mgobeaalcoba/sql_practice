-- Resolviendo diferencias

-- Alumnos por carrera

SELECT carrera_id, COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;

-- DELETE FROM platzi.carreras
-- WHERE id BETWEEN 30 AND 40;

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL -- Ej de Left join exclusive
ORDER BY carrera_id;

-- Reto: Left join entre alumnos y carreras sin condiciones

SELECT *
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY carrera_id;

-- Reto: Join completo entre alumnos y carreras sin condiciones

SELECT *
FROM platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY carrera_id; -- Vamos a ver alumnos sin carrera y carreras sin alumnos. 
