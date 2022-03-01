-- En mis tiempos
-- Aprovechar el formato fecha y/o hora

-- Extracción de partes de la fecha

SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incor,
		EXTRACT(MONTH FROM fecha_incorporacion) AS mes_incor,
		EXTRACT(DAY FROM fecha_incorporacion) AS dia_incor
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incor2,
		DATE_PART('MONTH', fecha_incorporacion) AS mes_incor2,
		DATE_PART('DAY', fecha_incorporacion) AS dia_incor2
FROM platzi.alumnos;

-- Te permite comenzar a filtrar por agrupados de fechas o hacer
-- joins mas flexibles

-- Reto: Sacar los campos de la hora, minutos, segundos, horas

SELECT EXTRACT(HOUR FROM fecha_incorporacion) AS hora_incor,
		EXTRACT(MINUTE FROM fecha_incorporacion) AS min_incor,
		EXTRACT(SECOND FROM fecha_incorporacion) AS seg_incor
FROM platzi.alumnos;

SELECT DATE_PART('HOUR', fecha_incorporacion) AS hora_incor2,
		DATE_PART('MINUTE', fecha_incorporacion) AS min_incor2,
		DATE_PART('SECOND', fecha_incorporacion) AS seg_incor2
FROM platzi.alumnos;
