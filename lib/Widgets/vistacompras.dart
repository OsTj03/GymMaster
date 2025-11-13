import 'package:flutter/material.dart';
import '../data/models/compra-modelo.dart';
import '../apps_colors.dart';
import '../data/models/producto_modelo.dart';

class VistaCompra extends StatelessWidget {
  const VistaCompra({
    super.key,
    required this.registro,
    required this.onTap,
  });

  final RegistroDeCompra registro;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Formateador de fecha
    final String formattedDate = '${registro.fechaCompra.day}/${registro.fechaCompra.month}/${registro.fechaCompra.year}';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        color: AppsColors.primaryAccentColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Compra #${registro.idCompra}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppsColors.primary,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppsColors.primary,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Fecha: $formattedDate',
                style: TextStyle(
                  fontSize: 14,
                  color: AppsColors.primary.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Total: \$${registro.costoTotal.toStringAsFixed(2)} NIO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppsColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Items: ${registro.detalleCompras.length} productos',
                style: TextStyle(
                  fontSize: 14,
                  color: AppsColors.primary.withOpacity(0.8),
                ),
              ),
              if (registro.detalleCompras.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Producto ID: ${registro.detalleCompras[0].idProducto} x ${registro.detalleCompras[0].cantidad}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppsColors.primary.withOpacity(0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              if (registro.detalleCompras.length > 1)
                Text(
                  '... y ${registro.detalleCompras.length - 1} más',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppsColors.primary.withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}