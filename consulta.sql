USE sistema_gestion_hospitalaria;

-- 1. 
SELECT m.nombre, m.apellido, e.nombre_especialidad
FROM Medicos m
INNER JOIN Especialidades e ON m.id_especialidad = e.id_especialidad
ORDER BY m.apellido ASC;


-- 2. 
SELECT id_habitacion, numero_habitacion, tipo, estado
FROM Habitaciones
WHERE tipo IN ('UCI', 'Privada') AND estado = 'Disponible';


-- 3. 
SELECT id_medicamento, nombre_comercial, principio_activo, stock_actual, precio_unitario
FROM Medicamentos
WHERE stock_actual < 50
ORDER BY stock_actual ASC;


-- 4.
SELECT c.id_cita, p.nombre AS paciente_nombre, p.apellido AS paciente_apellido, 
       m.nombre AS medico_nombre, m.apellido AS medico_apellido, c.fecha_hora
FROM Citas c
INNER JOIN Pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN Medicos m ON c.id_medico = m.id_medico
WHERE c.estado = 'Programada';


-- 5.
SELECT h.fecha_registro, h.diagnostico, h.observaciones, 
       m.nombre AS medico_nombre, m.apellido AS medico_apellido
FROM Historial_Medico h
INNER JOIN Medicos m ON h.id_medico = m.id_medico
WHERE h.id_paciente = 1
ORDER BY h.fecha_registro DESC;


-- 6. 
SELECT f.id_factura, p.nombre, p.apellido, f.monto_total, f.fecha_emision, f.estado_pago
FROM Facturacion f
INNER JOIN Pacientes p ON f.id_paciente = p.id_paciente
WHERE f.estado_pago = 'Pendiente';

-- 7. 
SELECT e.nombre_especialidad, COUNT(m.id_medico) AS total_medicos
FROM Especialidades e
LEFT JOIN Medicos m ON e.id_especialidad = m.id_especialidad
GROUP BY e.id_especialidad, e.nombre_especialidad;

-- 8.
SELECT med.nombre_comercial, SUM(rd.cantidad) AS cantidad_total_recetada
FROM Recetas_Detalle rd
INNER JOIN Medicamentos med ON rd.id_medicamento = med.id_medicamento
GROUP BY med.id_medicamento, med.nombre_comercial
ORDER BY cantidad_total_recetada DESC;


-- 9.
SELECT metodo_pago, SUM(monto_total) AS total_recaudado
FROM Facturacion
WHERE estado_pago = 'Pagado'
GROUP BY metodo_pago;


-- 10.
SELECT p.nombre AS paciente_nombre, p.apellido AS paciente_apellido, 
       med.nombre_comercial AS medicamento, rd.cantidad, rd.instrucciones_dosis
FROM Recetas_Detalle rd
INNER JOIN Historial_Medico h ON rd.id_historial = h.id_historial
INNER JOIN Pacientes p ON h.id_paciente = p.id_paciente
INNER JOIN Medicamentos med ON rd.id_medicamento = med.id_medicamento;
