import 'package:flutter/material.dart';
import '../data/models/categoria-modelo.dart';
import '../apps_colors.dart';

class VistaCategoria extends StatelessWidget {
  const VistaCategoria({
    super.key,
    required this.categoria,
    required this.onEliminar,
  });
  final Categoria categoria;
  final Function(int) onEliminar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
        },
        child: Container(
          color: AppsColors.primaryAccentColor, 
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppsColors.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.category,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoria.nombreCategoria,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppsColors.accent, 
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          categoria.descripcion,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppsColors.accent, 
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ]
                  ),
                )
              ),
              // Botón de eliminar
              IconButton(
                onPressed: () {
                  _mostrarDialogoEliminar(context);
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              Icon(
                categoria.estado ? Icons.check_circle : Icons.remove_circle,
                color: categoria.estado ? Colors.green : Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoEliminar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar Categoría'),
          content: Text('¿Estás seguro de que quieres eliminar "${categoria.nombreCategoria}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onEliminar(categoria.categoriaID);
              },
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}