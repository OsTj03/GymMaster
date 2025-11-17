import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/apps_colors.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/compra-modelo.dart';
import '../../data/Services/regiscompra-service.dart';
import '../../Widgets/vistacompras.dart';

@RoutePage()
class HistorialComprasPage extends StatefulWidget {
  const HistorialComprasPage({super.key});

  @override
  State<HistorialComprasPage> createState() => _HistorialComprasPageState();
}

class _HistorialComprasPageState extends State<HistorialComprasPage> {
  final CompraService _compraService = CompraService();
  List<RegistroDeCompra> _registrosDeCompras = [];
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadCompras();
  }

Future<void> _loadCompras() async {
  try {
    final compras = await _compraService.getCompras();
    if (mounted) { 
      setState(() {
        _registrosDeCompras = compras;
        _loading = false;
      });
    }
  } catch (e) {
    if (mounted) {
      setState(() {
        _error = 'Error al cargar compras: $e';
        _loading = false;
      });
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsColors.tercernivel,
      body: CustomScrollView(
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

          if (_loading)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
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
          else if (_registrosDeCompras.isEmpty)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('No hay compras registradas'),
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final registro = _registrosDeCompras[index];
                  return VistaCompra(
                    registro: registro,
                    onTap: () {
                      context.router.push(CompraDetailRoute(compra: registro));
                    },
                  );
                },
                childCount: _registrosDeCompras.length,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.router.push(AddCompraRoute());
          _loadCompras();
        },
        //boton de agregar compra
        child: Icon(Icons.add),
        backgroundColor:AppsColors.primaryAccentColor,
      ),
    );
  }
}