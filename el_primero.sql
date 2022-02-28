SELECT * FROM platzi.alumnos
LIMIT 1;

SELECT * FROM platzi.carreras
LIMIT 1;

SELECT * FROM platzi.alumnos
FETCH FIRST 1 ROWS ONLY;

SELECT * FROM platzi.carreras
FETCH FIRST 5 ROWS ONLY;

SELECT * 
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, * -- Window Function: Agrego un numero de fila a cada row
	FROM platzi.alumnos
) AS alumnos_with_row_nums -- Obligatorio asignarle un arias a mi sub-query
WHERE row_id = 1; -- Filtro por el numero agregado

-- Reto: Traer los primeros 5 registros de la tabla alumnos

SELECT * FROM platzi.alumnos
LIMIT 5;

SELECT * FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;

SELECT * 
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_nums
WHERE row_id < 6;
