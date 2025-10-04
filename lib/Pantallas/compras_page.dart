import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart';
import '../data/registrocompra.dart';
import '../data/listaproductos.dart';
import '../Widgets/vistacompras.dart';

@RoutePage()
class HistorialComprasPage extends StatefulWidget {
  const HistorialComprasPage({super.key});

  @override
  State<HistorialComprasPage> createState() => _HistorialComprasPageState();
}

class _HistorialComprasPageState extends State<HistorialComprasPage> {
  final List<RegistroDeCompra> _registrosDeCompras = [];

  @override
  void initState() {
    super.initState();
    _generarDatosDePrueba();
  }

  void _generarDatosDePrueba() {
    final listadeproducto proteina = listadeproducto(
      id: 1,
      nombre: 'Proteina de Chocolate',
      descripcion: 'Suplemento de proteína whey',
      precio: 100,
      imagen: 'assets/images/Proteinachocolate.webp',
    );
    final listadeproducto creatina = listadeproducto(
      id: 2,
      nombre: 'Creatina Monohidratada',
      descripcion: 'Mejora fuerza y rendimiento',
      precio: 80,
      imagen: 'assets/images/creatina.webp',
    );
    final listadeproducto preEntreno = listadeproducto(
      id: 3,
      nombre: 'Pre-Entreno Explosivo',
      descripcion: 'Energía y enfoque para tus entrenamientos',
      precio: 120,
      imagen: 'assets/images/preentreno.webp',
    );


    _registrosDeCompras.add(RegistroDeCompra(
      id: 1,
      fecha: DateTime(2023, 10, 26, 10, 30),
      total: 180.0,
      items: [
        ItemComprado(producto: proteina, cantidad: 1),
        ItemComprado(producto: creatina, cantidad: 1),
      ],
    ));

    _registrosDeCompras.add(RegistroDeCompra(
      id: 2,
      fecha: DateTime(2023, 10, 25, 15, 00),
      total: 240.0,
      items: [
        ItemComprado(producto: preEntreno, cantidad: 2),
      ],
    ));

    _registrosDeCompras.add(RegistroDeCompra(
      id: 3,
      fecha: DateTime(2023, 10, 24, 08, 15),
      total: 100.0,
      items: [
        ItemComprado(producto: proteina, cantidad: 1),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/comprasv2.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250, 
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              ),
            ],
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final registro = _registrosDeCompras[index];
              return VistaCompra(registro: registro);
            },
            childCount: _registrosDeCompras.length,
          ),
        ),
      ],
    );
  }
}