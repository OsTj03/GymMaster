import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Removido el AppBar para que el título pueda superponerse
        body: Stack(
          children: <Widget>[
            // Imagen de fondo (primer widget, en la parte inferior del Stack)
            Image.asset(
              'assets/images/gymini.jpg',
              // Asegura que la imagen ocupe todo el ancho
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250, // Ajusta la altura de la imagen
            ),

            // Título de la aplicación (segundo widget, apilado encima)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ), // Ajusta el espacio desde la parte superior
                child: Text(
                  'Inicio',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .black, // Puedes cambiar el color para que se vea sobre la imagen
                  ),
                ),
              ),
            ),

            // Contenido restante (debajo de la imagen superpuesta)
            Padding(
              padding: const EdgeInsets.only(
                top: 250,
              ), // Empuja el contenido debajo de la imagen
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text(
                      'Bienvenido a GymMaster',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navegación a la pantalla de login
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Inventario',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        // Navegación a la pantalla de registro
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Ventas',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),

                      ),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        // Navegación a la pantalla de registro
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Compras',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
