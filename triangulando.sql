-- Triangulando

SELECT lpad('sql',15,'*'); --Left padding: Acolchonamiento a la izquierda
SELECT rpad('sql',15,'+'); --right padding

-- Utilidades
-- Relleno dinámico

SELECT lpad('sql',id,'*')
FROM platzi.alumnos
WHERE id <= 10; -- Un triangulo

SELECT rpad('*',id,'*'), lpad('*',id,'*')
FROM platzi.alumnos
WHERE id <= 10; -- Dos triangulos

-- Al querer ordenar por carrera_id se me desordena el triangulo

SELECT lpad('*',id,'*'), carrera_id
FROM platzi.alumnos
WHERE id <= 10
ORDER BY carrera_id;

-- Solución:

SELECT lpad('*',CAST(row_id AS integer),'*') -- Tengo que castear row_id de bigint a integer
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5;

-- dos formas mas de castearlo:

SELECT lpad('*',CAST(row_id AS int),'*') -- Tengo que castear row_id de bigint a integer
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5;

-- Ó:

SELECT lpad('*',row_id::integer,'*') -- Tengo que castear row_id de bigint a integer
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5;

SELECT lpad('*',row_id::int,'*') -- Tengo que castear row_id de bigint a integer
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;

-- Reto: Jugar con rpad. Resuelto arriba: 

SELECT rpad('sql',15,'+'); --right padding

-- Función que acolchona pero a la derecha en lugar de a la izquieda como lpad