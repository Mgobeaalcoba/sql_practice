-- Regularizando expresiones o "expresiones regulares"
-- Herramienta muy poderosa en cualquier lenguaje

SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@[A-Z0-9._]+\.[A-Z]{2,4}';
-- Aca le digo a mi query que formato y tipo de dato debe tener mi email para ser seleccionado

SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@google[A-Z0-9._]+\.[A-Z]{2,4}';
-- Aca filtro todas las que con ese formato son necesariamente @google