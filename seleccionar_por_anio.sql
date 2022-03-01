-- Seleccionar por año
-- Usamos los extracts y date_part en los filtros (where)

SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2019;

SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

SELECT *
FROM (
	SELECT *,
		DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio -- Obligatorio poner alias a sub-query en el from
WHERE anio_incorporacion = 2020;

-- Reto: Cuales son los alumnos que se incorporaron en mayo de 2018

SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018
	AND (EXTRACT(MONTH FROM fecha_incorporacion)) = 5;
	
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2018
	AND (DATE_PART('MONTH', fecha_incorporacion)) = 5;
	
SELECT *
FROM (
	SELECT *,
		DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
		EXTRACT(MONTH FROM fecha_incorporacion) AS mes_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio
WHERE anio_incorporacion = 2020
	AND mes_incorporacion = 5;