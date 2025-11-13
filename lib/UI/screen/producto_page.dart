import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/producto_modelo.dart';
import '../../data/services/servicio_producto.dart';
import '../../../Widgets/vista_producto.dart';

@RoutePage()
class ProductoPage extends StatefulWidget {
  const ProductoPage({super.key});

  @override
  State<ProductoPage> createState() => _ProductopageState();
}

class _ProductopageState extends State<ProductoPage> {
  final ProductoService _productService = ProductoService();
  List<Producto> _productos = [];
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final productos = await _productService.getProductos();
      setState(() {
        _productos = productos;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar productos: $e';
        _loading = false;
      });
    }
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
        
        if (_loading)
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Cargando productos...'),
              ),
            ),
          )
        else if (_error.isNotEmpty)
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(_error),
              ),
            ),
          )
        else if (_productos.isEmpty)
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('No hay productos disponibles'),
              ),
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final producto = _productos[index];
                return VistaProducto(item: producto); // Cambiado a VistaProducto
              },
              childCount: _productos.length,
            ),
          ),
      ],
    );
  }
}