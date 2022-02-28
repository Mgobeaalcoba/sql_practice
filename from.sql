-- From clasico por tabla

SELECT * FROM base.tabla;

-- From de tablas joineadas y con alias

SELECT *
FROM base_de_datos.tabla_diaria AS td 
    JOIN base_de_datos.tabla_mensual as tm 
    ON td.pk = tm.fk;

-- From de tablas que están en otra base de datos
-- Una externa. Uso de dblink

SELECT *
FROM dblink('
    dbname = somedb
    port = 5432
    host = someuser
    user = someuser
    password = somepwd',
    'SELECT gid, area, perimeter,
            state, country,
            tract, blockgoup,
            block, the_geom
    FROM massgis.cens2000blocks')
    AS blockgoups
