DROP TABLE IF EXISTS historico;
DROP TABLE IF EXISTS solicitudes;

CREATE TABLE solicitudes (
  id SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  descripcion TEXT NOT NULL,
  tipo TEXT,
  solicitante TEXT,
  responsable TEXT,
  estado TEXT DEFAULT 'PENDIENTE',
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE historico (
  id SERIAL PRIMARY KEY,
  solicitud_id INTEGER NOT NULL,
  estado_anterior TEXT,
  estado_nuevo TEXT NOT NULL,
  usuario TEXT NOT NULL,
  comentario TEXT,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_solicitud
    FOREIGN KEY (solicitud_id)
    REFERENCES solicitudes(id)
    ON DELETE CASCADE
);
