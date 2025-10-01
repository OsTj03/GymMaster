import 'package:flutter/material.dart';
import '../registrocompra.dart';
import '../apps_colors.dart';
class VistaCompra extends StatelessWidget {
  const VistaCompra({
    super.key,
    required this.registro,
  });

  final RegistroDeCompra registro;

  @override
  Widget build(BuildContext context) {
    // Formateador de fecha
    final String formattedDate = '${registro.fecha.day}/${registro.fecha.month}/${registro.fecha.year}';

    return GestureDetector(
      onTap: () {
        print('Compra #${registro.id} seleccionada');
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        color: AppsColors.sizedboxcolor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Compra #${registro.id}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppsColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Fecha: $formattedDate',
                style: TextStyle(
                  fontSize: 14,
                  color: AppsColors.textPrimary.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Total: \$${registro.total.toStringAsFixed(2)} NIO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppsColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Items: ${registro.items.length} productos',
                style: TextStyle(
                  fontSize: 14,
                  color: AppsColors.textPrimary.withOpacity(0.8),
                ),
              ),
              if (registro.items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    '- ${registro.items[0].producto.nombre} x ${registro.items[0].cantidad}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppsColors.textPrimary.withOpacity(0.7),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              if (registro.items.length > 1)
                Text(
                  '... y ${registro.items.length - 1} más',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppsColors.textPrimary.withOpacity(0.7),
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