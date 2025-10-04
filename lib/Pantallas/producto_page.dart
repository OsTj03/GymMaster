import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart';
import '../data/listaproductos.dart';
import '../../Widgets/vista_producto.dart';

@RoutePage()
class ProductoPage extends StatefulWidget {
  const ProductoPage({super.key});

  @override
  State<ProductoPage> createState() => _ProductopageState();
}

class _ProductopageState extends State<ProductoPage> {
  final List<listadeproducto> items = [
    listadeproducto(
      id: 1,
      nombre: 'Proteina',
      descripcion: 'Proteina de chocolate',
      precio: 100,
      imagen: 'assets/images/Proteinachocolate.webp',
    ),
    listadeproducto(
      id: 2,
      nombre: 'Creatina',
      descripcion: 'Creatina monohidratada',
      precio: 80,
      imagen: 'assets/images/creatina.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/productoimagen.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
        
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final item = items[index];
              return vistaproducto(item: item);
            },
            childCount: items.length,
          ),
        ),
      ],
    );
  }
}