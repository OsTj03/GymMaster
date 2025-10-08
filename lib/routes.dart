import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:gymmaster/routes.gr.dart';
import 'package:gymmaster/UI/screen/Login.dart';      
import 'package:gymmaster/UI/screen/main_layout_screen.dart';
import 'UI/screen/pantalla_inicio.dart';
import 'UI/screen/inventario.dart';
import 'UI/screen/producto_page.dart';
import 'UI/screen/compras_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LoginRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: MainLayoutRoute.page,
      path: '/',
      title: (context, data) => 'GymMaster',
    
      children: [
        AutoRoute(
          page: PantallaRoute.page,
          path: '',
          title: (context, data) => 'Inicio',
        ),
      
        AutoRoute(
          page: HelloWorldRoute.page,
          path: '',
          title: (context, data) => 'Inventario',
        ),
      
        AutoRoute(
          page: ProductoRoute.page,
          path: '',
        ),
        
        AutoRoute(
          page: HistorialComprasRoute.page,
          path: '',
          title: (context, data) => 'Historial de Compras',
        )
      ],
    ),
  ];
} 