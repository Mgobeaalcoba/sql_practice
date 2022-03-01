-- Reto: Traer la segunda colegiatura (lo que se paga) mas alta

SELECT DISTINCT colegiatura
FROM platzi.alumnos
ORDER BY colegiatura DESC
OFFSET 1
LIMIT 1;

SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	SELECT COUNT (DISTINCT colegiatura)
	FROM platzi.alumnos a2
	WHERE a1.colegiatura <= a2.colegiatura
);

SELECT DISTINCT colegiatura
FROM platzi.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

SELECT * -- Devuelve todos los estudiantes que pagan lo mismo que la colegiatura mas baja del tutor 20
FROM platzi.alumnos AS datos_alumnos
INNER JOIN(
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;

SELECT * -- Devuelve todos los estudiantes que pagan lo mismo que la colegiatura mas baja del tutor 20
FROM platzi.alumnos AS datos_alumnos
INNER JOIN(
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;

-- Desafio: Traer solamente la segunda mitad de la tabla

SELECT *
FROM ( 
	SELECT ROW_NUMBER() OVER() AS row_id, * 
	FROM platzi.alumnos) AS number_table
WHERE number_table.row_id > (
	SELECT COUNT(id)/2 AS media_tabla
	FROM platzi.alumnos
	)
ORDER BY row_id ASC;

-- Otra solución:

SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
OFFSET(
	SELECT COUNT(*)/2
	FROM platzi.alumnos);

