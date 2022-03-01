-- Todas las uniones o joins

-- Left join exclusivo: Traigo todos los alumnos que no tienen info de carrera

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL;

-- Left join: Traigo todos los alumnos, sin importar si tienen o no carreras

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Right join: Traigo todas las carreras sin importar si tienen o no alumnos
-- No veremos los alumnos que se inscribieron entre la 30 y 40 que no existen

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Right join exclusive: Solo las carreras que no tienen alumnos

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
ORDER BY c.id DESC;

-- Join solo o Inner join: Aquello que tienen en comun ambas tablas

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	INNER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC; -- Join mas usado. 

-- Ó

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC; -- Join mas usado. 

-- Diferencia simétrica: Contrario al inner join: 
-- Está en cada tabla pero no en la otra

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
	OR c.id IS NULL
ORDER BY a.carrera_id DESC, c.id DESC;  

-- Reto: codigo que corresponde a cada uno de los diagramas de ben: Resuelto arriba