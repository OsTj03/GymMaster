import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/categoria-modelo.dart';
import '../../data/services/categoria-services.dart';
import '../../apps_colors.dart';

@RoutePage()
class AgregarCategoriaPage extends StatefulWidget {
  const AgregarCategoriaPage({super.key});

  @override
  State<AgregarCategoriaPage> createState() => _AgregarCategoriaPageState();
}

class _AgregarCategoriaPageState extends State<AgregarCategoriaPage> {
  final _formKey = GlobalKey<FormState>();
  final CategoriaService _categoriaService = CategoriaService();
  
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  bool _estado = true;
  bool _loading = false;

  Future<void> _agregarCategoria() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final nuevaCategoria = Categoria(
        categoriaID: 0,
        nombreCategoria: _nombreController.text,
        descripcion: _descripcionController.text,
        estado: _estado,
      );

      final success = await _categoriaService.crearCategoria(nuevaCategoria);
      
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Categoría agregada exitosamente')),
          );
          context.router.pop();
        }
      } else {
        throw Exception('El servidor rechazó la creación de la categoría');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al agregar categoría: $e')),
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
      backgroundColor: Color.fromARGB(255, 245, 243, 243),
      appBar: AppBar(
        title: Text('Agregar Categoría'),
        backgroundColor: AppsColors.background,
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
                  fillColor: AppsColors.textPrimary,
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
                    activeColor: AppsColors.sizedboxcolor,
                  ),
                  Text(_estado ? 'Activa' : 'Inactiva'),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _loading ? null : _agregarCategoria,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppsColors.primary,
                    foregroundColor: AppsColors.textPrimary
                  ),
                  child: _loading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Agregar Categoría',
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