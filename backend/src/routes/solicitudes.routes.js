const express = require('express');
const router = express.Router();
const controller = require('../controllers/solicitudes.controller');

router.post('/', controller.crearSolicitud);
router.get('/', controller.listarSolicitudes);
router.get('/:id', controller.obtenerDetalle);
router.post('/:id/decision', controller.decisionSolicitud);
router.get('/todas', controller.listarTodas);

module.exports = router;
