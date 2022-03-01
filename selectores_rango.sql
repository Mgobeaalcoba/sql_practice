-- Selectores de rango

SELECT *
FROM platzi.alumnos
WHERE tUtor_id IN (1,2,3,4);

SELECT *
FROM platzi.alumnos
WHERE tutor_id >=1
	AND tutor_id <= 10;
	
SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

SELECT int4range(10,20);  -- Construyo un rango entre 10 y 20

SELECT int4range(10,20) @> 3; -- ¿Está el 3 dentro del rango construido?

SELECT int4range(10,20) @> 15;

SELECT numrange (11.1, 22.2); -- Rango de decimales

SELECT numrange (11.1, 19.9) && numrange (20.0, 30.0); -- ¿Comparte numeros estos rangos? 

SELECT UPPER (int8range(15,25)); -- Devuelve el mas grande

SELECT LOWER (int8range(15,25)); -- Mas bajo

SELECT int4range(10,20) * int4range(15,25); -- Devuelve la interseccion entre rangos

SELECT ISEMPTY (numrange(0,0)); -- Está vacio el rango? 

-- Usemos esto para filtrar

SELECT *
FROM platzi.alumnos
WHERE int4range(10,20) @> tutor_id;  -- Alumnos con tutor_id entre 10 y 20

-- Reto: Interseccion o valores en comun entre dos rangos: los id de tutores y los id de carreras

-- Comparten numeros ambos rangos? 

SELECT numrange(MIN(platzi.alumnos.carrera_id), MAX(platzi.alumnos.carrera_id)) 
&& numrange(MIN(platzi.alumnos.tutor_id), MAX(platzi.alumnos.tutor_id)) AS comparten_rango
from platzi.alumnos;

-- ¿Que numeros comparten?

SELECT numrange(MIN(platzi.alumnos.carrera_id), MAX(platzi.alumnos.carrera_id)) 
* numrange(MIN(platzi.alumnos.tutor_id), MAX(platzi.alumnos.tutor_id)) AS numeros_compartidos
from platzi.alumnos;

-- Otra forma muy similar pero con sub-querys

SELECT numrange(
	(SELECT MIN(tutor_id) FROM platzi.alumnos),
	(SELECT MAX(tutor_id) FROM platzi.alumnos)
) * numrange(
	(SELECT MIN(carrera_id) FROM platzi.alumnos),
	(SELECT MAX(carrera_id) FROM platzi.alumnos)
);
