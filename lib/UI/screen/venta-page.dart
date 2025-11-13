import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/venta-modelo.dart';
import '../../data/Services/venta-service.dart';
import '../../Widgets/venta-vista.dart';
import '../../apps_colors.dart';

@RoutePage()
class VentaPage extends StatefulWidget {
  const VentaPage({super.key});

  @override
  State<VentaPage> createState() => _VentaPageState();
}

class _VentaPageState extends State<VentaPage> {
  final VentaService _ventaService = VentaService();
  List<Venta> _ventas = [];
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadVentas();
  }

  Future<void> _loadVentas() async {
    try {
      final ventas = await _ventaService.getVentas();
      setState(() {
        _ventas = ventas;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar ventas: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsColors.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/historialventa.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Historial de Ventas',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
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
          else if (_ventas.isEmpty)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('No hay ventas registradas'),
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final venta = _ventas[index];
                  return VistaVenta(venta: venta);
                },
                childCount: _ventas.length,
              ),
            ),
        ],
      ),
      // BOTÓN ELIMINADO - sin floatingActionButton
    );
  }
}