// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:gymmaster/main_layout_screen.dart' as _i3;
import 'package:gymmaster/Pantallas/inventario.dart' as _i2;
import 'package:gymmaster/Pantallas/pantalla_inicio.dart' as _i4;
import 'package:gymmaster/Widgets/barranaveg.dart' as _i1;

/// generated route for
/// [_i1.Barranaveg]
class Barranaveg extends _i5.PageRouteInfo<void> {
  const Barranaveg({List<_i5.PageRouteInfo>? children})
    : super(Barranaveg.name, initialChildren: children);

  static const String name = 'Barranaveg';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.Barranaveg();
    },
  );
}

/// generated route for
/// [_i2.HelloWorldScreen]
class HelloWorldRoute extends _i5.PageRouteInfo<void> {
  const HelloWorldRoute({List<_i5.PageRouteInfo>? children})
    : super(HelloWorldRoute.name, initialChildren: children);

  static const String name = 'HelloWorldRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HelloWorldScreen();
    },
  );
}

/// generated route for
/// [_i3.MainLayoutScreen]
class MainLayoutRoute extends _i5.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i5.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i4.PantallaScreen]
class PantallaRoute extends _i5.PageRouteInfo<void> {
  const PantallaRoute({List<_i5.PageRouteInfo>? children})
    : super(PantallaRoute.name, initialChildren: children);

  static const String name = 'PantallaRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.PantallaScreen();
    },
  );
}
