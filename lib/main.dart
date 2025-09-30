import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:auto_route/auto_route.dart';

// (Opcional) Si usas un archivo para tus colores, asegúrate de importarlo
// import 'apps_colors.dart'; 

void main() {
  // Función principal, el punto de partida de toda app Flutter
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Inicializa el router de tu aplicación
  // El nombre de esta clase (AppRouter) coincide con la que definiste en routes.dart
  final _appRouter = AppRouter(); 
  
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos MaterialApp.router para que auto_route pueda manejar la navegación
    return MaterialApp.router(
      // Configuración del router
      routerConfig: _appRouter.config(),
      
      // (Opcional) Puedes definir el título de la app
      title: 'Gym Master App',
      
      // (Opcional) Define el tema visual de tu app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

// -------------------------------------------------------------
// NOTA IMPORTANTE: 
// Ya no necesitas la clase MyHomePage ni MyHomePageState, 
// ya que auto_route gestiona el widget inicial de tu app 
// a través de la ruta con initial: true.
// Puedes eliminar las clases MyHomePage y _MyHomePageState de main.dart
// ya que solo están causando confusión.
// -------------------------------------------------------------