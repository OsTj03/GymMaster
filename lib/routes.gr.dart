// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:gymmaster/UI/screen/compras_page.dart' as _i3;
import 'package:gymmaster/UI/screen/inventario.dart' as _i2;
import 'package:gymmaster/UI/screen/Login.dart' as _i4;
import 'package:gymmaster/UI/screen/main_layout_screen.dart' as _i5;
import 'package:gymmaster/UI/screen/pantalla_inicio.dart' as _i6;
import 'package:gymmaster/UI/screen/producto_page.dart' as _i7;
import 'package:gymmaster/Widgets/barranaveg.dart' as _i1;

/// generated route for
/// [_i1.Barranaveg]
class Barranaveg extends _i8.PageRouteInfo<void> {
  const Barranaveg({List<_i8.PageRouteInfo>? children})
    : super(Barranaveg.name, initialChildren: children);

  static const String name = 'Barranaveg';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.Barranaveg();
    },
  );
}

/// generated route for
/// [_i2.HelloWorldScreen]
class HelloWorldRoute extends _i8.PageRouteInfo<void> {
  const HelloWorldRoute({List<_i8.PageRouteInfo>? children})
    : super(HelloWorldRoute.name, initialChildren: children);

  static const String name = 'HelloWorldRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HelloWorldScreen();
    },
  );
}

/// generated route for
/// [_i3.HistorialComprasPage]
class HistorialComprasRoute extends _i8.PageRouteInfo<void> {
  const HistorialComprasRoute({List<_i8.PageRouteInfo>? children})
    : super(HistorialComprasRoute.name, initialChildren: children);

  static const String name = 'HistorialComprasRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HistorialComprasPage();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    dynamic Function()? onLoginSuccess,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoginSuccess: onLoginSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i4.LoginScreen(
        key: args.key,
        onLoginSuccess: args.onLoginSuccess,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginSuccess});

  final _i9.Key? key;

  final dynamic Function()? onLoginSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i5.MainLayoutScreen]
class MainLayoutRoute extends _i8.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i8.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i6.PantallaScreen]
class PantallaRoute extends _i8.PageRouteInfo<void> {
  const PantallaRoute({List<_i8.PageRouteInfo>? children})
    : super(PantallaRoute.name, initialChildren: children);

  static const String name = 'PantallaRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.PantallaScreen();
    },
  );
}

/// generated route for
/// [_i7.ProductoPage]
class ProductoRoute extends _i8.PageRouteInfo<void> {
  const ProductoRoute({List<_i8.PageRouteInfo>? children})
    : super(ProductoRoute.name, initialChildren: children);

  static const String name = 'ProductoRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProductoPage();
    },
  );
}
