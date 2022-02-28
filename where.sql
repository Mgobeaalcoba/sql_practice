-- El where es la selección en algebra relacional
-- Se usa para filtrar tuplas o filas o row o renglones

-- Where basico o identitario

SELECT *
FROM tabla_diaria
WHERE id = 1;

-- Where filtrante

SELECT *
FROM tabla_diaria
WHERE cantidad > 10;

SELECT *
FROM tabla_diaria
WHERE cantidad < 100;

-- Where con mas de una condición
-- Persigue una rabanada de los datos

SELECT *
FROM tabla_diaria
WHERE cantidad > 10
    AND cantidad < 100;

SELECT *
FROM tabla_diaria
WHERE cantidad BETWEEN 10
    AND 100;

-- Where anidado con and y or

SELECT *
FROM users
WHERE name = 'Israel'
    AND (lastname = 'Vázquez'
        OR 
        lastname = 'López'
    );

-- Me da a traer todos los Israel Vazquez y todos
-- los Israel Lopez

SELECT *
FROM users
WHERE name = 'Israel'
    AND lastname = 'Vázquez'
    OR lastname = 'López';

-- Me va a traer todos los Israel Vazquez y todos
-- los lopez, sin importar el nombre

-- Where para string por cercania

SELECT *
FROM users
WHERE name LIKE 'iS%';

-- Me va a traer todo lo que empiece con Is

SELECT *
FROM users
WHERE name LIKE "Is_ael";

-- Me va a traer todo lo que empiece con Is y 
-- termine con ael sin importar la letra del _

SELECT *
FROM users
WHERE name NOT LIKE "Is_ael";

-- Me va a traer todo lo que no cumpla ese patron
-- por ej todos los que no sean ismael o israel.

-- Where para nulos

SELECT *
FROM users
WHERE name IS NULL;

SELECT *
FROM users
WHERE name IS NOT NULL;

SELECT *
FROM users
WHERE name IN ('Israel', 'Laura', 'Luis');

-- Me va a traer todos los que estén dentro de mi tupla
-- pasada como parametro del in

SELECT *
FROM users
WHERE name NOT IN ('Israel', 'Laura', 'Luis');

-- Contrario al anterior.
