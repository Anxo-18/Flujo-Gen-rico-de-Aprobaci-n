
INSERT INTO solicitudes
(id, titulo, descripcion, tipo, solicitante, responsable, estado, fecha_creacion)
VALUES
('c2bfe2dc-d871-4fe9-98a4-eb451677368d',
 'prueba despliegue',
 'prueba',
 'DESPLIEGUE',
 'juan.renteria',
 'lider.dev',
 'APROBADO',
 '2026-01-13 20:37:27.686'),

('b396ab78-9769-4804-a8d1-7d6fffe6c533',
 'solicitud acceso pc',
 'solicito acceso al programa de la empresa',
 'ACCESO',
 'juan.renteria',
 'lider.dev',
 'RECHAZADO',
 '2026-01-13 20:39:51.139'),

('7e254b1b-1e81-4ba3-9ec3-5e66fa22174e',
 'problemas hardware',
 'el computador de la oficina 3 no enciende',
 'CAMBIO_TECNICO',
 'juan.renteria',
 'lider.dev',
 'APROBADO',
 '2026-01-13 20:40:50.04'),

('debd7140-f397-46f5-8adf-8e3c8e0a33b0',
 'compra de equipos',
 'se solicita presupuesto para la compra de 10 computadores',
 'COMPRA',
 'juan.renteria',
 'lider.dev',
 'APROBADO',
 '2026-01-13 20:45:35.91');

INSERT INTO historico
(id, solicitud_id, estado_anterior, estado_nuevo, usuario, comentario, fecha)
VALUES
(1, 'c2bfe2dc-d871-4fe9-98a4-eb451677368d', NULL, 'PENDIENTE', 'juan.renteria', NULL, '2026-01-13 20:37:27.727'),
(2, 'c2bfe2dc-d871-4fe9-98a4-eb451677368d', 'PENDIENTE', 'APROBADO', 'lider.dev', NULL, '2026-01-13 20:37:33.503'),

(3, 'b396ab78-9769-4804-a8d1-7d6fffe6c533', NULL, 'PENDIENTE', 'juan.renteria', NULL, '2026-01-13 20:39:51.284'),
(4, 'b396ab78-9769-4804-a8d1-7d6fffe6c533', 'PENDIENTE', 'RECHAZADO', 'lider.dev', NULL, '2026-01-13 20:39:58.747'),

(5, '7e254b1b-1e81-4ba3-9ec3-5e66fa22174e', NULL, 'PENDIENTE', 'juan.renteria', NULL, '2026-01-13 20:40:50.079'),
(6, '7e254b1b-1e81-4ba3-9ec3-5e66fa22174e', 'PENDIENTE', 'APROBADO', 'lider.dev', 'en un momento se enviará a un técnico', '2026-01-13 20:41:22.004'),

(7, 'debd7140-f397-46f5-8adf-8e3c8e0a33b0', NULL, 'PENDIENTE', 'juan.renteria', NULL, '2026-01-13 20:45:35.946'),
(8, 'debd7140-f397-46f5-8adf-8e3c8e0a33b0', 'PENDIENTE', 'APROBADO', 'lider.dev', 'aceptado', '2026-01-13 20:45:52.414');
