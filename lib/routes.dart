import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:gymmaster/routes.gr.dart';
import 'package:gymmaster/UI/screen/Login.dart';
import 'package:gymmaster/UI/screen/main_layout_screen.dart';
import 'UI/screen/pantalla_inicio.dart';
import 'UI/screen/Categoria-page.dart';
import 'UI/screen/producto_page.dart';
import 'UI/screen/compras_page.dart';
import 'package:gymmaster/guards/auth-guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LoginRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: MainLayoutRoute.page,
      path: '/home',
      title: (context, data) => 'GymMaster',
      guards: [AuthGuard()],
      children: [
        AutoRoute(
          page: PantallaRoute.page,
          path: 'inicio',
          title: (context, data) => 'Inicio',
          initial: true,
        ),
        AutoRoute(
          page: CategoriaRoute.page,
          path: 'categorias',
          title: (context, data) => 'Inventario',
        ),
        AutoRoute(
          page: ProductoRoute.page,
          path: 'productos',
          title: (context, data) => 'Productos',
        ),
        AutoRoute(
          page: HistorialComprasRoute.page,
          path: 'compras',
          title: (context, data) => 'Historial de Compras',
        ),
        AutoRoute(
          page: AgregarCategoriaRoute.page,
          path: 'agregar-categoria',
        ),
        AutoRoute(
          page: EditarCategoriaRoute.page,
          path: 'editar-categoria',
        ),
        AutoRoute(
          page: VentaRoute.page,
          path: 'ventas',
        ),
        AutoRoute(
          page: CompraDetailRoute.page,
          path: 'compra-detail',
        ),
        AutoRoute(
          page: AddCompraRoute.page,
          path: 'add-compra',
        ),
      ],
    ),
  ];
}