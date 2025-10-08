import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';


class listadeproducto 
{
  final int id;
  final String nombre;
  final String descripcion;
  final int precio;
  final String imagen;

  listadeproducto({
  required this.id,
  required this.nombre,
  required this.descripcion,
  required this.precio,
  required this.imagen,
});
}