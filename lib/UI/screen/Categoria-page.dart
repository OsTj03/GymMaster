import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/data/models/categoria-modelo.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../apps_colors.dart';
import '../../data/Services/categoria-services.dart';
import '../../Widgets/categoria-vista.dart';

@RoutePage()
class CategoriaPage extends StatefulWidget {
  const CategoriaPage({super.key});

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  final CategoriaService _categoriaService = CategoriaService();
  List<Categoria> _categorias = [];
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadCategorias();
  }

  Future<void> _loadCategorias() async {
    try {
      final categorias = await _categoriaService.getCategorias();
      setState(() {
        _categorias = categorias;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar categorías: $e';
        _loading = false;
      });
    }
  }

  Future<void> _eliminarCategoria(int id) async {
    try {
      final success = await _categoriaService.eliminarCategoria(id);
      if (success) {
        // Remover la categoría de la lista localmente
        setState(() {
          _categorias.removeWhere((categoria) => categoria.categoriaID == id);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Categoría eliminada exitosamente')),
        );
      } else {
        throw Exception('El servidor rechazó la eliminación');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar categoría: $e')),
      );
    }
  }

  Future<void> _editarCategoria(Categoria categoria) async {
    await context.router.push(EditarCategoriaRoute(categoria: categoria));
    _loadCategorias(); // Refrescar después de editar
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
                  'assets/images/pantallacategoria.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Categorías',
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
          else if (_categorias.isEmpty)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('No hay categorías disponibles'),
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final categoria = _categorias[index];
                  return VistaCategoria(
                    categoria: categoria,
                    onEliminar: _eliminarCategoria,
                    onEditar: _editarCategoria,
                  );
                },
                childCount: _categorias.length,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.router.push(AgregarCategoriaRoute());
          _loadCategorias();
        },
        backgroundColor: AppsColors.textPrimary,
        child: Icon(Icons.add),
      ),
    );
  }
}