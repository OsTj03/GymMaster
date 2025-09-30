// lib/layout/main_layout_screen.dart

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart'; 
import 'package:gymmaster/apps_colors.dart';

@RoutePage()
class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentTitle = AutoRouter.of(context).current.title(context) ?? 'Gymmaste';

    return Scaffold(
      backgroundColor: AppsColors.background,
        appBar: AppBar(
          title: Text(currentTitle),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppsColors.textPrimary,
          ),
          backgroundColor: const Color(0xFF131313),
          leading: Builder( 
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
drawer: Drawer(
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
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.of( context).pop();
              AutoRouter.of(context).replace(const PantallaRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Inventario'),
            onTap: () {
              Navigator.of( context).pop();
              AutoRouter.of(context).replace(const HelloWorldRoute());
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
            },
          ),
        ],
      ),
    ),
      
      body: const AutoRouter(),
    );
  }
}