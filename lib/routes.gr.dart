// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:gymmaster/UI/screen/Categoria-page.dart' as _i3;
import 'package:gymmaster/UI/screen/compras_page.dart' as _i4;
import 'package:gymmaster/UI/screen/crearcatego.dart' as _i1;
import 'package:gymmaster/UI/screen/Login.dart' as _i5;
import 'package:gymmaster/UI/screen/main_layout_screen.dart' as _i6;
import 'package:gymmaster/UI/screen/pantalla_inicio.dart' as _i7;
import 'package:gymmaster/UI/screen/producto_page.dart' as _i8;
import 'package:gymmaster/Widgets/barranaveg.dart' as _i2;

/// generated route for
/// [_i1.AgregarCategoriaPage]
class AgregarCategoriaRoute extends _i9.PageRouteInfo<void> {
  const AgregarCategoriaRoute({List<_i9.PageRouteInfo>? children})
    : super(AgregarCategoriaRoute.name, initialChildren: children);

  static const String name = 'AgregarCategoriaRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AgregarCategoriaPage();
    },
  );
}

/// generated route for
/// [_i2.Barranaveg]
class Barranaveg extends _i9.PageRouteInfo<void> {
  const Barranaveg({List<_i9.PageRouteInfo>? children})
    : super(Barranaveg.name, initialChildren: children);

  static const String name = 'Barranaveg';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.Barranaveg();
    },
  );
}

/// generated route for
/// [_i3.CategoriaPage]
class CategoriaRoute extends _i9.PageRouteInfo<void> {
  const CategoriaRoute({List<_i9.PageRouteInfo>? children})
    : super(CategoriaRoute.name, initialChildren: children);

  static const String name = 'CategoriaRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.CategoriaPage();
    },
  );
}

/// generated route for
/// [_i4.HistorialComprasPage]
class HistorialComprasRoute extends _i9.PageRouteInfo<void> {
  const HistorialComprasRoute({List<_i9.PageRouteInfo>? children})
    : super(HistorialComprasRoute.name, initialChildren: children);

  static const String name = 'HistorialComprasRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HistorialComprasPage();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    dynamic Function()? onLoginSuccess,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoginSuccess: onLoginSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i5.LoginScreen(
        key: args.key,
        onLoginSuccess: args.onLoginSuccess,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginSuccess});

  final _i10.Key? key;

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
/// [_i6.MainLayoutScreen]
class MainLayoutRoute extends _i9.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i9.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i7.PantallaScreen]
class PantallaRoute extends _i9.PageRouteInfo<void> {
  const PantallaRoute({List<_i9.PageRouteInfo>? children})
    : super(PantallaRoute.name, initialChildren: children);

  static const String name = 'PantallaRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.PantallaScreen();
    },
  );
}

/// generated route for
/// [_i8.ProductoPage]
class ProductoRoute extends _i9.PageRouteInfo<void> {
  const ProductoRoute({List<_i9.PageRouteInfo>? children})
    : super(ProductoRoute.name, initialChildren: children);

  static const String name = 'ProductoRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProductoPage();
    },
  );
}
