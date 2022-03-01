-- WF: Particiones y agregaciones

-- Agrego numero de columna ordenada
SELECT ROW_NUMBER() OVER() AS row_id, * 
FROM platzi.alumnos;

-- Nueva columna con el data del primer valor de colegiatura de la tabla arrastrado
SELECT FIRST_VALUE(colegiatura) OVER() AS row_id, * 
FROM platzi.alumnos;

-- Nueva columna con el data del primer valor de colegiatura para cada carrera_id
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS row_id, * 
FROM platzi.alumnos;

-- Lo mismo pero con el ultimo valor de colegiatura por carrera
SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS row_id, * 
FROM platzi.alumnos;

-- Le paso como segundo parametro de NTH_VALUE la ordinalidad del valor que quiero repetir de colegiatura por carrera. En el ej el tercero.
SELECT NTH_VALUE(colegiatura, 3) OVER(PARTITION BY carrera_id) AS row_id, * 
FROM platzi.alumnos;

-- Rango o ranking: lugar que ocupa de acuerdo a un orden

-- RANK si tengo 4 iguales les asigna el mismo valor, y al 5 le da el valor 5
SELECT *,
	RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

-- DENSE_RANK si tengo 4 iguales les asigna el mismo valor, y al 5 le da el valor 2
SELECT *,
	DENSE_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

-- PERCENT_RANK: (rank -1) / (total rows -1) Ranking porcentual
SELECT *,
	PERCENT_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;
