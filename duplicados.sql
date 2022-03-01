-- Duplicados: Encontrarlos

-- Inserto el duplicado
insert into platzi.alumnos (id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id)
values (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16);

-- Busco si tengo registros duplicados por id. La cantidad

SELECT *
FROM platzi.alumnos as ou
WHERE (
	SELECT COUNT(*)
	FROM platzi.alumnos AS inr
	WHERE ou.id = inr.id
) > 1;

-- Para regresar los registros duplicados con el id

SELECT (platzi.alumnos.*)::text, COUNT(*) -- :: Es equivalente a CAST a texto
FROM platzi.alumnos
GROUP BY platzi.alumnos.*  -- Agrupo por tupla en texto
HAVING COUNT(*) > 1; -- Filtro aquellos count que estén mas de una vez

-- Para regresar los registros duplicados sin el id

SELECT (
		platzi.alumnos.nombre,
		platzi.alumnos.apellido,
		platzi.alumnos.email,
		platzi.alumnos.colegiatura,
		platzi.alumnos.fecha_incorporacion,
		platzi.alumnos.carrera_id,
		platzi.alumnos.tutor_id
		)::text, COUNT(*) -- :: Es equivalente a CAST a texto
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
		platzi.alumnos.apellido,
		platzi.alumnos.email,
		platzi.alumnos.colegiatura,
		platzi.alumnos.fecha_incorporacion,
		platzi.alumnos.carrera_id,
		platzi.alumnos.tutor_id  -- Agrupo por tupla en texto
HAVING COUNT(*) > 1; -- Filtro aquellos count que estén mas de una vez

-- Ahora si tenemos el insertado apareciendo 2 veces. 

-- Ultima forma con sub-query y window functions de encontrar duplicados

SELECT *
FROM (
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		ORDER BY id ASC
	) AS row, *
	FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1;

-- Reto: Borrado de los duplicados

DELETE
FROM platzi.alumnos
WHERE id IN(
	SELECT id
	FROM (
		SELECT ID,
		ROW_NUMBER() OVER(
			PARTITION BY
				nombre,
				apellido,
				email,
				colegiatura,
				fecha_incorporacion,
				carrera_id,
				tutor_id
			ORDER BY id ASC
		) AS row
		FROM platzi.alumnos
	) AS duplicados
	WHERE duplicados.row > 1);
    