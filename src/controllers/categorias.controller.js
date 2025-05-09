import { pool } from '../db.js';

// Obtener todos los clientes
export const obtenerCategorias= async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Categorias');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de los categoria.',
      error: error
    });
  }
};

// Registrar una nueva categoría
export const registrarCategoria = async (req, res) => {
    try {
      const { nombre_categoria, descripcion_categoria } = req.body;
  
      const [result] = await pool.query(
        'INSERT INTO categorias (nombre_categoria, descripcion_categoria) VALUES (?, ?)',
        [nombre_categoria, descripcion_categoria]
      );
  
      res.status(201).json({ id_categoria: result.insertId });
    } catch (error) {
      return res.status(500).json({
        mensaje: 'Ha ocurrido un error al registrar la categoría.',
        error: error
      });
    }
  };

// Obtener un cliente por su ID
export const obtenerCliente = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Clientes WHERE id_cliente = ?', [req.params.id]);
    
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: 'Error al leer los datos. El ID ${req.params.id} del cliente no fue encontrado.'
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos del cliente.'
    });
  }
};

// Eliminar una categoría por su ID
export const eliminarCategoria = async (req, res) => {
  try {
    const [result] = await pool.query('DELETE FROM categorias WHERE id_categoria = ?', [req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Error al eliminar la categoría. El ID ${req.params.id} no fue encontrado.`
      });
    }

    res.status(204).send(); // Respuesta sin contenido para indicar éxito
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar la categoría.',
      error: error
    });
  }
};

// Actualizar una categoría por su ID (parcial o completa)
export const actualizarCategoria = async (req, res) => {
  try {
    const { id } = req.params;
    const datos = req.body;

    const [resultado] = await pool.query(
      'UPDATE categorias SET ? WHERE id_categoria = ?',
      [datos, id]
    );

    if (resultado.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `La categoría con ID ${id} no existe.`,
      });
    }

    res.status(204).send(); // Respuesta sin contenido para indicar éxito
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Error al actualizar la categoría.',
      error: error,
    });
  }
};