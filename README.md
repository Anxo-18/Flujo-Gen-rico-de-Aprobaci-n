Aplicación web fullstack para gestionar solicitudes de aprobación de manera centralizada,
permitiendo trazabilidad completa del proceso.

## Arquitectura

- Frontend: React
- Backend: Node.js + Express
- Base de Datos: PostgreSQL

## Funcionalidad

- Crear solicitudes genéricas de aprobación
- Bandeja de solicitudes pendientes por aprobador
- Aprobación o rechazo con comentario
- Histórico de cambios por solicitud

## Ejecución

### Backend

cd backend
npm install
npm run dev

### Frontend

cd frontend
npm install
npm start

### Base de datos

Las tablas principales son:

solicitudes
historico

Incluyen control de estado y trazabilidad por fechas.

## Funcionalidades

Crear solicitudes

Ver todas las solicitudes

Aprobar / Rechazar

Historial de cambios

## Autor

Juan Ángel Rentería Puerto
