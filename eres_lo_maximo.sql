-- Eres lo máximo

-- Maximo

SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

-- Maxima fecha por carrera

SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

-- Reto: extraer el minimo nombre, alfabeticamente, que existe en nuestra tabla
-- de toda la tabla y el minimo por id de tutor

-- Nombre mínimo alfabeticamente hablando

SELECT nombre
FROM platzi.alumnos
ORDER BY nombre
LIMIT 1;

-- Nombre mínimo alfabeticamente hablando por tutor_id

SELECT tutor_id, MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;
