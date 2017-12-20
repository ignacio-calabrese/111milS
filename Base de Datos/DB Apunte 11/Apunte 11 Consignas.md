1) Crear la Base de Datos prueba Crear la tabla person (dni integer, name text) 
Crear triggers que registren las altas, bajas y modificaciones que se produzcan insertando tuplas en una tabla de log como la siguiente:
log (id	serial PRIMARY KEY,timestamptz	timestamptz DEFAULT now(),detail text)

Resuelto en esquema b
