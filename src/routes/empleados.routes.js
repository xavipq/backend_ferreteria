import { Router } from 'express';
import {  obtenerEmpleados } from '../controllers/empleados.controller.js';

const router = Router();

// Ruta para obtener todos los clientes
router.get('/empleados', obtenerEmpleados);

export default router;