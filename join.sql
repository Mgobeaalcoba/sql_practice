-- Los joins son en la mayoria de los casos son un
-- producto cartesiano. Todos por todos

-- join clasico

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk;

-- tipos de join: diagramas de ben

-- left join: Todo A mas lo de B que exista en A

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    LEFT JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk;

-- right join: Todo B mas lo de A que exista en B

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    RIGHT JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk;

-- Exclusive Left Join: Todo lo que existe en A y estoy
-- seguro que no existe en B

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    LEFT JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk
    WHERE tm.id IS NULL;

-- Full Outer Join: Todos los de A por todos los de B

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    FULL OUTER JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk;

-- Exclusive Full Outer Join; Todo lo de A por todo lo de B
-- que no se repite entre A y B

-- Inner Join o interseccion: Lo que se comparte entre ambas tablas:
-- El mas usado de los joins

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    INNER JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk;
