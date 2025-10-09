import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/categoria-modelo.dart';
import '../../data/Services/categoria-services.dart';
import '../../apps_colors.dart';

@RoutePage()
class EditarCategoriaPage extends StatefulWidget {
  final Categoria categoria;
  
  const EditarCategoriaPage({
    super.key,
    required this.categoria,
  });

  @override
  State<EditarCategoriaPage> createState() => _EditarCategoriaPageState();
}

class _EditarCategoriaPageState extends State<EditarCategoriaPage> {
  final _formKey = GlobalKey<FormState>();
  final CategoriaService _categoriaService = CategoriaService();
  
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  bool _estado = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nombreController.text = widget.categoria.nombreCategoria;
    _descripcionController.text = widget.categoria.descripcion;
    _estado = widget.categoria.estado;
  }

  Future<void> _editarCategoria() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      // Crear objeto categoría actualizado
      final categoriaActualizada = Categoria(
        categoriaID: widget.categoria.categoriaID,
        nombreCategoria: _nombreController.text,
        descripcion: _descripcionController.text,
        estado: _estado,
      );

      final success = await _categoriaService.editarCategoria(categoriaActualizada);
      
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Categoría actualizada exitosamente')),
          );
          context.router.pop();
        }
      } else {
        throw Exception('El servidor rechazó la actualización');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar categoría: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Categoría'),
        backgroundColor: AppsColors.background,
        iconTheme: IconThemeData(color: AppsColors.textPrimary),
        foregroundColor: AppsColors.textPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre de la categoría',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una descripción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Estado:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  Switch(
                    value: _estado,
                    onChanged: (value) {
                      setState(() {
                        _estado = value;
                      });
                    },
                    activeColor: AppsColors.primary,
                  ),
                  Text(_estado ? 'Activa' : 'Inactiva'),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _loading ? null : _editarCategoria,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppsColors.primary,
                    foregroundColor: AppsColors.textPrimary,
                  ),
                  child: _loading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Actualizar Categoría',
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}