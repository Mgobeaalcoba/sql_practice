-- Seleccion de un set de opciones

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id IN (1,5,10,15);

-- Traer todos los alumnos cuyo tutor sea el 30 mediante
-- seleccion de set por sub-query

SELECT * 
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);

-- Traer todos los alumnos que NO se encuentren en los sets
-- estudiados arriba

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id NOT IN (1,5,10,15);

SELECT * 
FROM platzi.alumnos
WHERE id NOT IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);
