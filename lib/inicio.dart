import 'package:flutter/material.dart';
import 'Componentes/barranaveg.dart' hide AppsColors;
import 'apps_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppsColors.background,
        appBar: AppBar(
          title: const Text('Inicio'),
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
        drawer: Barranaveg(), 
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Imagen de fondo
              Image.asset(
                'assets/images/gymini.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              const SizedBox(height: 20),
              Text(
                'Bienvenido a GymMaster',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppsColors.textPrimary,
                ),
              ),

              // Espacio debajo de la imagen
              const SizedBox(height: 10),

              // Contenido con la grilla de botones
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), 
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.0,
                  children: <Widget>[
                    _buildSquareButton('Inventario', Icons.inventory, () {}),
                    _buildSquareButton('Ventas', Icons.monetization_on, () {}),
                    _buildSquareButton('Compras', Icons.shopping_cart, () {}),
                    _buildSquareButton('Productos', Icons.fitness_center, () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSquareButton(String title, IconData icon, VoidCallback onPressed) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppsColors.accent, AppsColors.accent.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
