-- Window Functions o WF de acá en mas

SELECT *,
		AVG(colegiatura) OVER (PARTITION BY carrera_id) -- Le pido el promedio de costo de colegiatura por carrera
FROM platzi.alumnos;

-- Para hacer esto sin WF primero debo agrupar por carrera_id y calcular el promedio y luego hacer un join

SELECT *
FROM platzi.alumnos AS alum
	INNER JOIN (
				SELECT carrera_id, AVG(colegiatura)
				FROM platzi.alumnos
				GROUP BY carrera_id
				ORDER BY carrera_id ASC) AS prom
	ON alum.carrera_id = prom.carrera_id
ORDER BY alum.carrera_id ASC;

-- Window Functions o WF de acá en mas

SELECT *,
		AVG(colegiatura) OVER () 
FROM platzi.alumnos;
-- Sin particion nos dará el promedio general de colegiatura

-- En lugar de partirlo vamos a sumar y ponerle order by dentro de la WF
SELECT *,
		SUM(colegiatura) OVER (ORDER BY colegiatura) 
FROM platzi.alumnos;
-- Me va mostrando el total acumulado de cada valor de colegiatura

SELECT *,
		SUM(colegiatura) OVER (PARTITION BY carrera_id ORDER BY colegiatura) 
FROM platzi.alumnos;
-- Me va mostrando el total acumulado de valor de colegiatura pero esta vez
-- por carrera, primero la 1, y así ...

-- Ranking o rank:

SELECT *,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) 
FROM platzi.alumnos;
-- Me arma el ranking de costos de colegiaturas por carreras. Si dos rows
-- tienen el mismo valor tendrán el mismo ranking, pero el siguiente contemplada 
-- las rows repetidas. Ej: 1,1,1,1,5...

-- Como filtrar usando window function (Las mismas corren al final de la query
-- solo antes del FROM y el ORDER BY). Para esto debo meter la WF dentro del FROM
-- mediante una sub-query

SELECT *
FROM (
		SELECT *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
		FROM platzi.alumnos
) as ranked_colegiaturas_por_carrera
WHERE brand_rank < 3
ORDER BY brand_rank;
