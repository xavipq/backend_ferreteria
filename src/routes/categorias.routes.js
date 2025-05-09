import { Router } from 'express';
import {  obtenerCategorias, registrarCategoria, eliminarCategoria, actualizarCategoria } from '../controllers/categorias.controller.js';

const router = Router();

// Ruta para obtener todos los clientes
router.get('/categorias', obtenerCategorias);
// Ruta para obtener un cliente por su ID
router.post('/registrarcategoria', registrarCategoria);
//ruta para eliminar una categoría por su ID
router.delete('/eliminarcategoria/:id', eliminarCategoria);
// Ruta para actualizar una categoría por su ID
router.patch('/actualizarcategoria/:id', actualizarCategoria);


export default router;