// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:gymmaster/data/models/categoria-modelo.dart' as _i12;
import 'package:gymmaster/UI/screen/Categoria-page.dart' as _i3;
import 'package:gymmaster/UI/screen/compras_page.dart' as _i5;
import 'package:gymmaster/UI/screen/crearcatego.dart' as _i1;
import 'package:gymmaster/UI/screen/editarCat.dart' as _i4;
import 'package:gymmaster/UI/screen/Login.dart' as _i6;
import 'package:gymmaster/UI/screen/main_layout_screen.dart' as _i7;
import 'package:gymmaster/UI/screen/pantalla_inicio.dart' as _i8;
import 'package:gymmaster/UI/screen/producto_page.dart' as _i9;
import 'package:gymmaster/Widgets/barranaveg.dart' as _i2;

/// generated route for
/// [_i1.AgregarCategoriaPage]
class AgregarCategoriaRoute extends _i10.PageRouteInfo<void> {
  const AgregarCategoriaRoute({List<_i10.PageRouteInfo>? children})
    : super(AgregarCategoriaRoute.name, initialChildren: children);

  static const String name = 'AgregarCategoriaRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AgregarCategoriaPage();
    },
  );
}

/// generated route for
/// [_i2.Barranaveg]
class Barranaveg extends _i10.PageRouteInfo<void> {
  const Barranaveg({List<_i10.PageRouteInfo>? children})
    : super(Barranaveg.name, initialChildren: children);

  static const String name = 'Barranaveg';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.Barranaveg();
    },
  );
}

/// generated route for
/// [_i3.CategoriaPage]
class CategoriaRoute extends _i10.PageRouteInfo<void> {
  const CategoriaRoute({List<_i10.PageRouteInfo>? children})
    : super(CategoriaRoute.name, initialChildren: children);

  static const String name = 'CategoriaRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.CategoriaPage();
    },
  );
}

/// generated route for
/// [_i4.EditarCategoriaPage]
class EditarCategoriaRoute
    extends _i10.PageRouteInfo<EditarCategoriaRouteArgs> {
  EditarCategoriaRoute({
    _i11.Key? key,
    required _i12.Categoria categoria,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         EditarCategoriaRoute.name,
         args: EditarCategoriaRouteArgs(key: key, categoria: categoria),
         initialChildren: children,
       );

  static const String name = 'EditarCategoriaRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditarCategoriaRouteArgs>();
      return _i4.EditarCategoriaPage(key: args.key, categoria: args.categoria);
    },
  );
}

class EditarCategoriaRouteArgs {
  const EditarCategoriaRouteArgs({this.key, required this.categoria});

  final _i11.Key? key;

  final _i12.Categoria categoria;

  @override
  String toString() {
    return 'EditarCategoriaRouteArgs{key: $key, categoria: $categoria}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditarCategoriaRouteArgs) return false;
    return key == other.key && categoria == other.categoria;
  }

  @override
  int get hashCode => key.hashCode ^ categoria.hashCode;
}

/// generated route for
/// [_i5.HistorialComprasPage]
class HistorialComprasRoute extends _i10.PageRouteInfo<void> {
  const HistorialComprasRoute({List<_i10.PageRouteInfo>? children})
    : super(HistorialComprasRoute.name, initialChildren: children);

  static const String name = 'HistorialComprasRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.HistorialComprasPage();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i11.Key? key,
    dynamic Function()? onLoginSuccess,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoginSuccess: onLoginSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i6.LoginScreen(
        key: args.key,
        onLoginSuccess: args.onLoginSuccess,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginSuccess});

  final _i11.Key? key;

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
/// [_i7.MainLayoutScreen]
class MainLayoutRoute extends _i10.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i10.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i8.PantallaScreen]
class PantallaRoute extends _i10.PageRouteInfo<void> {
  const PantallaRoute({List<_i10.PageRouteInfo>? children})
    : super(PantallaRoute.name, initialChildren: children);

  static const String name = 'PantallaRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.PantallaScreen();
    },
  );
}

/// generated route for
/// [_i9.ProductoPage]
class ProductoRoute extends _i10.PageRouteInfo<void> {
  const ProductoRoute({List<_i10.PageRouteInfo>? children})
    : super(ProductoRoute.name, initialChildren: children);

  static const String name = 'ProductoRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProductoPage();
    },
  );
}
