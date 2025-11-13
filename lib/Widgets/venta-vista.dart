import 'package:flutter/material.dart';
import '../data/models/venta-modelo.dart';
import '../apps_colors.dart';

class VistaVenta extends StatelessWidget {
  const VistaVenta({
    super.key,
    required this.venta,
  });
  final Venta venta;

  @override
  Widget build(BuildContext context) {
    final formattedDate = '${venta.fechaVenta.day}/${venta.fechaVenta.month}/${venta.fechaVenta.year}';
    final formattedTime = '${venta.fechaVenta.hour}:${venta.fechaVenta.minute.toString().padLeft(2, '0')}';

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
                  Icons.receipt,
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
                        'Venta #${venta.idVenta}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppsColors.accent, 
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '$formattedDate - $formattedTime',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppsColors.accent, 
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '${venta.detalleVenta.length} productos',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppsColors.accent, 
                          ),
                        ),
                      )
                    ]
                  ),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${venta.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppsColors.accent, 
                    ),
                  ),
                  Text(
                    'IVA: \$${venta.iva.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppsColors.accent, 
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}