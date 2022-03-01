-- Generando rangos

SELECT *
FROM generate_series(5,1,-2); -- Igual a numpy: inicio, fin y salto

SELECT *
FROM generate_series(1,50,3); -- Similar a los np.arrays de Pyhton

-- Rango entre semanas partiendo de hoy

SELECT current_date + s.a AS dates
FROM generate_series(0,14,7) AS s(a); -- Obtengo hoy, el proximo martes y el siguiente martes

-- Generar una tabla que vaya del 01.09.2020 al 04.09.2020 cada 10 hs

SELECT *
FROM generate_series('2020-09-01 00:00:00'::timestamp,
					'2020-09-04 12:00:00', '10 hours');

-- Join con la nada, o como usar los joins para filtrar:

SELECT  a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a
FROM platzi.alumnos AS a
	INNER JOIN generate_series(0,10) AS s(a)
	ON s.a = a.carrera_id
ORDER BY a.carrera_id;

-- Reto: Generar un triangulo a partir rangos generados por ti

SELECT lpad('*',s.a,'*')
FROM generate_series(1,15) AS s(a);

-- Otra forma:

SELECT lpad('*', CAST(ordinality AS int), '*')
FROM generate_series(10,2,-2) WITH ordinality; -- Ordinalidad le agrega un indice numerico entero a la serie
-- Uso la ordinalidad para ir armando el triangulo de uno en uno pese a que mi serie descienda de 2 en 2
