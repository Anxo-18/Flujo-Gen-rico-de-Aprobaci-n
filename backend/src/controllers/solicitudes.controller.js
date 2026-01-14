const pool = require('../config/db');
const { v4: uuidv4 } = require('uuid');

exports.crearSolicitud = async (req, res) => {
  const { titulo, descripcion, tipo, solicitante, responsable } = req.body;
  const id = uuidv4();

  await pool.query(
    'INSERT INTO solicitudes VALUES ($1,$2,$3,$4,$5,$6,$7,$8)',
    [id, titulo, descripcion, tipo, solicitante, responsable, 'PENDIENTE', new Date()]
  );

  await pool.query(
    'INSERT INTO historico (solicitud_id, estado_nuevo, usuario, fecha) VALUES ($1,$2,$3,$4)',
    [id, 'PENDIENTE', solicitante, new Date()]
  );

  res.json({ id });
};

exports.listarSolicitudes = async (req, res) => {
  const { responsable, estado } = req.query;
  const r = await pool.query(
    'SELECT * FROM solicitudes WHERE responsable=$1 AND estado=$2',
    [responsable, estado]
  );
  res.json(r.rows);
};

exports.obtenerDetalle = async (req, res) => {
  const id = req.params.id;
  const solicitud = await pool.query('SELECT * FROM solicitudes WHERE id=$1', [id]);
  const historico = await pool.query('SELECT * FROM historico WHERE solicitud_id=$1 ORDER BY fecha', [id]);
  res.json({ solicitud: solicitud.rows[0], historico: historico.rows });
};

exports.decisionSolicitud = async (req, res) => {
  const { accion, usuario, comentario } = req.body;
  const id = req.params.id;

  const estadoNuevo = accion === 'APROBAR' ? 'APROBADO' : 'RECHAZADO';

  const actual = await pool.query(
    'SELECT estado FROM solicitudes WHERE id=$1',
    [id]
  );

  const estadoAnterior = actual.rows[0].estado;

  await pool.query(
    'UPDATE solicitudes SET estado=$1 WHERE id=$2',
    [estadoNuevo, id]
  );

  await pool.query(
    `INSERT INTO historico 
     (solicitud_id, estado_anterior, estado_nuevo, usuario, comentario, fecha)
     VALUES ($1,$2,$3,$4,$5,$6)`,
    [id, estadoAnterior, estadoNuevo, usuario, comentario, new Date()]
  );

  res.json({ message: 'Decisión registrada' });
};

exports.listarTodas = async (req, res) => {
  const r = await pool.query(
    'SELECT * FROM solicitudes ORDER BY fecha_creacion DESC'
  );
  res.json(r.rows);
};

