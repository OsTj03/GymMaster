import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart'; 
import 'package:gymmaster/routes.gr.dart';
import 'package:gymmaster/main_layout_screen.dart';
import 'Pantallas/pantalla_inicio.dart';
import 'Pantallas/inventario.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainLayoutRoute.page,
      path: '/',
      initial: true,
      title: (context, data) => 'GymMaster',
      
      children: [
        AutoRoute(
          page: PantallaRoute.page,
          path: '',
          title: (context, data) => 'Inicio',
        ),
        
        AutoRoute(
          page: HelloWorldRoute.page,
          path: 'hello-world',
          title: (context, data) => 'Inventario',
        ),
      ],
    ),
  ];
}