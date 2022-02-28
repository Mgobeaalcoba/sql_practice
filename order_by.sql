-- Order by es opcional. Ordena una tabla por

SELECT *
FROM tabla_diaria
ORDER BY fecha;

-- Por defecto ordena de forma ascendente
-- Si quiero que descienda debo agregar el DESC al final

SELECT *
FROM tabla_diaria
ORDER BY fecha DESC;


SELECT *
FROM tabla_diaria
ORDER BY fecha ASC;

-- Podemos agregar indices para busquedas y ordenamientos
-- mas eficientes. Sirven para alto transito de consultas

-- La contraparte del indice es que hace lenta la incorporación
-- de nuevos datos.
