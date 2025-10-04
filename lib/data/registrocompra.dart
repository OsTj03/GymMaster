import 'package:flutter/widgets.dart';

import 'listaproductos.dart';

class ItemComprado {
  final listadeproducto producto;
  final int cantidad;

  ItemComprado({
    required this.producto,
    required this.cantidad,
  });
}

class RegistroDeCompra {
  final int id;
  final DateTime fecha;
  final double total;
  final List<ItemComprado> items;

  RegistroDeCompra({
    required this.id,
    required this.fecha,
    required this.total,
    required this.items,
  });
}