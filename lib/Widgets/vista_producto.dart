import 'package:flutter/material.dart';
import '../data/models/producto_modelo.dart'; // Cambiado a producto_modelo
import '../apps_colors.dart';

class VistaProducto extends StatelessWidget { // Cambiado a PascalCase
  const VistaProducto({
    super.key,
    required this.item,
  });
  final Producto item; // Cambiado a Producto

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: AppsColors.primaryAccentColor, 
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container( 
                  color: AppsColors.accent, 
                  width: 72,
                  height: 72,
                  child: item.imagen.isNotEmpty 
                      ? Image.network( // Cambiado a Image.network para URL
                          item.imagen,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon( // Placeholder si la imagen falla
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 32,
                            );
                          },
                        )
                      : Icon( // Placeholder si no hay imagen
                          Icons.shopping_bag,
                          color: Colors.white,
                          size: 32,
                        ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.nombre, // Cambiado a namebrev
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppsColors.accent, 
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          item.descripcion, // Cambiado a description
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
              Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  // Precio removido temporalmente - agregar cuando el API lo envíe
                  Text(
                    'Ver detalles', // Placeholder
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppsColors.accent, 
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}