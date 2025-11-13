// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:gymmaster/data/models/categoria-modelo.dart' as _i16;
import 'package:gymmaster/data/models/compra-modelo.dart' as _i15;
import 'package:gymmaster/UI/screen/addCompra.dart' as _i1;
import 'package:gymmaster/UI/screen/Categoria-page.dart' as _i4;
import 'package:gymmaster/UI/screen/compras_page.dart' as _i7;
import 'package:gymmaster/UI/screen/crearcatego.dart' as _i2;
import 'package:gymmaster/UI/screen/Detalle-compra.dart' as _i5;
import 'package:gymmaster/UI/screen/editarCat.dart' as _i6;
import 'package:gymmaster/UI/screen/Login.dart' as _i8;
import 'package:gymmaster/UI/screen/main_layout_screen.dart' as _i9;
import 'package:gymmaster/UI/screen/pantalla_inicio.dart' as _i10;
import 'package:gymmaster/UI/screen/producto_page.dart' as _i11;
import 'package:gymmaster/UI/screen/venta-page.dart' as _i12;
import 'package:gymmaster/Widgets/barranaveg.dart' as _i3;

/// generated route for
/// [_i1.AddCompraPage]
class AddCompraRoute extends _i13.PageRouteInfo<void> {
  const AddCompraRoute({List<_i13.PageRouteInfo>? children})
    : super(AddCompraRoute.name, initialChildren: children);

  static const String name = 'AddCompraRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCompraPage();
    },
  );
}

/// generated route for
/// [_i2.AgregarCategoriaPage]
class AgregarCategoriaRoute extends _i13.PageRouteInfo<void> {
  const AgregarCategoriaRoute({List<_i13.PageRouteInfo>? children})
    : super(AgregarCategoriaRoute.name, initialChildren: children);

  static const String name = 'AgregarCategoriaRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.AgregarCategoriaPage();
    },
  );
}

/// generated route for
/// [_i3.Barranaveg]
class Barranaveg extends _i13.PageRouteInfo<void> {
  const Barranaveg({List<_i13.PageRouteInfo>? children})
    : super(Barranaveg.name, initialChildren: children);

  static const String name = 'Barranaveg';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.Barranaveg();
    },
  );
}

/// generated route for
/// [_i4.CategoriaPage]
class CategoriaRoute extends _i13.PageRouteInfo<void> {
  const CategoriaRoute({List<_i13.PageRouteInfo>? children})
    : super(CategoriaRoute.name, initialChildren: children);

  static const String name = 'CategoriaRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.CategoriaPage();
    },
  );
}

/// generated route for
/// [_i5.CompraDetailPage]
class CompraDetailRoute extends _i13.PageRouteInfo<CompraDetailRouteArgs> {
  CompraDetailRoute({
    _i14.Key? key,
    required _i15.RegistroDeCompra compra,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         CompraDetailRoute.name,
         args: CompraDetailRouteArgs(key: key, compra: compra),
         initialChildren: children,
       );

  static const String name = 'CompraDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompraDetailRouteArgs>();
      return _i5.CompraDetailPage(key: args.key, compra: args.compra);
    },
  );
}

class CompraDetailRouteArgs {
  const CompraDetailRouteArgs({this.key, required this.compra});

  final _i14.Key? key;

  final _i15.RegistroDeCompra compra;

  @override
  String toString() {
    return 'CompraDetailRouteArgs{key: $key, compra: $compra}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CompraDetailRouteArgs) return false;
    return key == other.key && compra == other.compra;
  }

  @override
  int get hashCode => key.hashCode ^ compra.hashCode;
}

/// generated route for
/// [_i6.EditarCategoriaPage]
class EditarCategoriaRoute
    extends _i13.PageRouteInfo<EditarCategoriaRouteArgs> {
  EditarCategoriaRoute({
    _i14.Key? key,
    required _i16.Categoria categoria,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         EditarCategoriaRoute.name,
         args: EditarCategoriaRouteArgs(key: key, categoria: categoria),
         initialChildren: children,
       );

  static const String name = 'EditarCategoriaRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditarCategoriaRouteArgs>();
      return _i6.EditarCategoriaPage(key: args.key, categoria: args.categoria);
    },
  );
}

class EditarCategoriaRouteArgs {
  const EditarCategoriaRouteArgs({this.key, required this.categoria});

  final _i14.Key? key;

  final _i16.Categoria categoria;

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
/// [_i7.HistorialComprasPage]
class HistorialComprasRoute extends _i13.PageRouteInfo<void> {
  const HistorialComprasRoute({List<_i13.PageRouteInfo>? children})
    : super(HistorialComprasRoute.name, initialChildren: children);

  static const String name = 'HistorialComprasRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.HistorialComprasPage();
    },
  );
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i14.Key? key,
    dynamic Function()? onLoginSuccess,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoginSuccess: onLoginSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i8.LoginScreen(
        key: args.key,
        onLoginSuccess: args.onLoginSuccess,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginSuccess});

  final _i14.Key? key;

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
/// [_i9.MainLayoutScreen]
class MainLayoutRoute extends _i13.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i13.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i10.PantallaScreen]
class PantallaRoute extends _i13.PageRouteInfo<void> {
  const PantallaRoute({List<_i13.PageRouteInfo>? children})
    : super(PantallaRoute.name, initialChildren: children);

  static const String name = 'PantallaRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.PantallaScreen();
    },
  );
}

/// generated route for
/// [_i11.ProductoPage]
class ProductoRoute extends _i13.PageRouteInfo<void> {
  const ProductoRoute({List<_i13.PageRouteInfo>? children})
    : super(ProductoRoute.name, initialChildren: children);

  static const String name = 'ProductoRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProductoPage();
    },
  );
}

/// generated route for
/// [_i12.VentaPage]
class VentaRoute extends _i13.PageRouteInfo<void> {
  const VentaRoute({List<_i13.PageRouteInfo>? children})
    : super(VentaRoute.name, initialChildren: children);

  static const String name = 'VentaRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.VentaPage();
    },
  );
}
