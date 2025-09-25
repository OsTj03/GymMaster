import 'package:flutter/material.dart';
import 'package:gymmaster/apps_colors.dart';

class Barranaveg extends StatelessWidget {
  const Barranaveg({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppsColors.primary,
            ),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Inventario'),
            onTap: () {
              // Agrega aquí la acción al presionar
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Ventas'),
            onTap: () {
              // Agrega aquí la acción al presionar
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Compras'),
            onTap: () {
              // Agrega aquí la acción al presionar
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Productos'),
            onTap: () {
              // Agrega aquí la acción al presionar
            },
          ),
        ],
      ),
    );
  }
}
