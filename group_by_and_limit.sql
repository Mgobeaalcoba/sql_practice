-- Ultimos dos conceptos optativos y utiles:
-- Group by y limit

-- La agregación se realiza en el select pero se declara
-- luego del from con la clausula group by

-- Ejemplos

SELECT *
FROM tabla_diaria
GROUP BY marca;

SELECT AVG(sales), SUM(sales)
FROM tabla_diaria
GROUP BY marca, modelo;

-- Limit: Pone un limite a la cantidad de rows o filas
-- que quiero que me muestre. Ej: Top Ten luego de order by

SELECT *
FROM tabla_diaria
LIMIT 1500;

SELECT *
FROM tabla_diaria
OFFSET 1500 -- Cuantos quiero saltar de mi limite. 
LIMIT 1500;
