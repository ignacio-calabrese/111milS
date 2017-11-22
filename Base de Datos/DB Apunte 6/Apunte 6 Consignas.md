1) Desarrolle el diagrama E/R para la base de datos inmobiliaria.

https://github.com/gbasisty/111mil/blob/master/baseDatos/inmobiliaria_adt.sql


2) Desarrolle el diagrama E/R para el Ejercicio 1 del Apunte 2 de Base de Datos:

Crear una base de datos relacional para un instituto de formación profesional. Se debe registrar alumnos, docentes y cursos. Determinar qué alumnos está inscritos en cada curso, y qué docentes están dictando cada curso. 

Respecto a los alumnos se desea saber:

-Nombre (obligatorio)
-Apellido (obligatorio)
-DNI (obligatorio y único)
-Fecha de Nacimiento (obligatorio)
-Dirección (obligatorio)
-Teléfono 
-eMail
-Fecha de Inscripción (obligatorio)
-Número de legajo (obligatorio y único)
-Qué curso está realizando

Respecto a los docentes se desea saber:

-Nombre (obligatorio)
-Apellido (obligatorio)
-DNI (obligatorio y único)
-Fecha de Nacimiento (obligatorio)
-Dirección (obligatorio)
-Teléfono 
-eMail
-Fecha de contratación (obligatorio)
-CUIL (obligatorio y único)
-Honorarios (obligatorio, y debe ser mayor que cero)
-De qué curso es docente

Respecto a los cursos se desea saber:
-Nombre del curso (obligatorio y único)
-Descripción (obligatorio)
-Código del curso (obligatorio y único)
-Costo del curso (obligatorio, y debe ser mayor que cero)

3) Crear el modelo de datos para una agencia de alquiler de vehículos. 

Se desea registrar respecto a los clientes: 
-Nombre (obligatorio)
-Apellido (obligatorio)
-Fecha de nacimiento (obligatorio)
-DNI (obligatorio y único)
-Género (obligatorio, Masculino o Femenino)
-Dirección
-Teléfono
-Correo electrónico

Se desea registrar respecto a los vehículos: 
-Patente (obligatorio y único)
-Marca (obligatorio)
-Modelo (obligatorio)
-Tipo (obligatorio, Auto o Utilitario)
-Fecha de adquisición (obligatorio) 

Respecto a los alquileres se desea saber: 
-Que cliente alquiló que vehículo
-En qué momento lo retiró (obligatorio)
-En qué momento lo devolvió (nulo si aún no lo devuelve)
-Cuál es el costo total del alquiler (debe ser mayor a cero)
