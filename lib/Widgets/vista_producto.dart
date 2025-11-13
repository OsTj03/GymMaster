import 'package:flutter/material.dart';
import '../data/models/producto_modelo.dart';
import '../apps_colors.dart';

class VistaProducto extends StatelessWidget {
  const VistaProducto({
    super.key,
    required this.item,
  });
  final Producto item;

  static const Map<String, String> _imageMap = {
    'Proteina A': 'assets/images/Proteinachocolate.webp',
  };

  String _getImagePath() {
    final nombre = item.nombre.toLowerCase();
    for (final key in _imageMap.keys) {
      if (nombre.contains(key)) {
        return _imageMap[key]!;
      }
    }
    
    return 'assets/images/producto_default.jpg';
  }

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
                  child: Image.asset(
                    _getImagePath(),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 32,
                      );
                    },
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
                        item.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppsColors.accent, 
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          item.descripcion,
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
                  Text(
                    'Ver detalles',
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