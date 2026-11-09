# TP-N-8-Especificaci-n-de-Requisitos-y-Consultas-SQL

1) Requisitos funcionales
   1: Registro y asignación de citas médicas

Formato (EARS): "Cuando un recepcionista programe una cita, el sistema deberá asociar un paciente existente con un médico activo y registrar la fecha, hora y el estado inicial como 'Programada'."

Regla de negocio: No se pueden duplicar citas para el mismo médico en exactamente el mismo horario.

   2: Gestión y actualización del historial médico

Formato (User Story): "Como médico, quiero registrar diagnósticos y observaciones asociados a un paciente y a una atención, para mantener actualizado su historial clínico electrónico."

Criterios de aceptación: El historial almacena automáticamente la fecha de registro actual mediante la base de datos.

   3: Control de stock de medicamentos y recetas

Formato (EARS): "Cuando un médico prescriba un tratamiento en el detalle de recetas, el sistema deberá registrar la cantidad y las dosis indicadas vinculadas al historial médico correspondiente."

Regla de negocio: El medicamento seleccionado debe existir previamente en el catálogo farmacéutico.

   4: Gestión de ocupación de habitaciones

Formato (Caso de uso resumido): "El sistema permite al personal administrativo modificar el estado de las habitaciones ('Disponible', 'Ocupada', 'Mantenimiento') según el tipo ('UCI', 'General', 'Privada') para optimizar la asignación hospitalaria."

   05: Emisión y control de facturación

Formato (EARS): "Cuando se cierre una atención o servicio, el sistema deberá generar un registro de facturación asociado al paciente, calculando el monto total y permitiendo registrar el método de pago y el estado ('Pendiente', 'Pagado', 'Anulado')."

Listado de consultas

Consulta Simple: Listar todos los médicos activos mostrando su nombre, apellido y el nombre de su especialidad correspondiente, ordenados alfabéticamente por apellido.

Consulta Simple: Obtener todas las habitaciones de tipo 'UCI' o 'Privada' que se encuentren actualmente con estado 'Disponible'.

Consulta Simple: Mostrar el listado de todos los medicamentos cuyo stock actual sea menor a 50 unidades, ordenados de menor a mayor stock.

Consulta Intermedia: Listar todas las citas médicas programadas (con estado 'Programada') indicando el nombre y apellido del paciente, el nombre y apellido del médico y la fecha/hora de la cita.

Consulta Intermedia: Obtener el historial médico completo de un paciente específico (filtrando por su ID), mostrando fecha de registro, diagnóstico, y los datos del médico que lo atendió.

Consulta Intermedia: Consultar todas las facturas emitidas que posean un estado de pago 'Pendiente', mostrando el nombre del paciente, el monto total y la fecha de emisión.

Consulta Avanzada: Contar la cantidad total de médicos que existen en cada especialidad, mostrando el nombre de la especialidad y el total de profesionales.

Consulta Avanzada: Obtener el listado de los 3 medicamentos más recetados (sumando la cantidad total solicitada en Recetas_Detalle), ordenados de mayor a menor cantidad.

Consulta Avanzada: Calcular el monto total recaudado por cada método de pago considerando únicamente las facturas que se encuentren con estado 'Pagado'.

Consulta Avanzada: Obtener un reporte completo de las recetas emitidas en los historiales médicos, mostrando el nombre del paciente, el medicamento recetado, la cantidad y las instrucciones de la dosis.
