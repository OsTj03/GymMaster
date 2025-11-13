import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/apps_colors.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/compra-modelo.dart';
import '../../data/models/Proveedor-modelo.dart';
import '../../data/models/producto_modelo.dart';
import 'package:gymmaster/data/Services/Proveedor-services.dart';
import 'package:gymmaster/data/Services/servicio_producto.dart';
import 'package:gymmaster/data/Services/regiscompra-service.dart';

@RoutePage()
class AddCompraPage extends StatefulWidget {
  const AddCompraPage({super.key});

  @override
  State<AddCompraPage> createState() => _AddCompraPageState();
}

class _AddCompraPageState extends State<AddCompraPage> {
  final CompraService _compraService = CompraService();
  final ProveedorService _proveedorService = ProveedorService();
  final ProductoService _productoService = ProductoService();

  List<Proveedor> _proveedores = [];
  List<Producto> _productos = [];
  Proveedor? _proveedorSeleccionado;
  final List<DetalleCompraItem> _detalles = [];
  
  bool _loadingProveedores = true;
  bool _loadingProductos = true;
  bool _enviando = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadProveedores();
    _loadProductos();
  }

  Future<void> _loadProveedores() async {
    try {
      final proveedores = await _proveedorService.getProveedores();
      setState(() {
        _proveedores = proveedores;
        _loadingProveedores = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar proveedores: $e';
        _loadingProveedores = false;
      });
    }
  }

  Future<void> _loadProductos() async {
    try {
      final productos = await _productoService.getProductos();
      setState(() {
        _productos = productos;
        _loadingProductos = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar productos: $e';
        _loadingProductos = false;
      });
    }
  }

  void _agregarProducto() {
    showDialog(
      context: context,
      builder: (context) => _ProductoDialog(
        productos: _productos,
        onAgregar: (producto, cantidad, precio) {
          final detalle = DetalleCompraItem(
            idProducto: producto.idProducto,
            cantidad: cantidad,
            precioUnitario: precio,
          );
          setState(() {
            _detalles.add(detalle);
          });
        },
      ),
    );
  }

  void _eliminarProducto(int index) {
    setState(() {
      _detalles.removeAt(index);
    });
  }

  Future<void> _guardarCompra() async {
    if (_proveedorSeleccionado == null) {
      _mostrarError('Selecciona un proveedor');
      return;
    }

    if (_detalles.isEmpty) {
      _mostrarError('Agrega al menos un producto');
      return;
    }

    setState(() {
      _enviando = true;
    });

    try {
      final compra = Compra(
        idProveedor: _proveedorSeleccionado!.idProveedor,
        fechaCompra: DateTime.now(),
        detalleCompra: _detalles,
      );

      await _compraService.createCompra(compra);
      
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _mostrarError('Error al guardar compra: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _enviando = false;
        });
      }
    }
  }

  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.red,
      ),
    );
  }

  double get _totalCompra {
    return _detalles.fold(0, (total, detalle) {
      return total + (detalle.cantidad * detalle.precioUnitario);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Compra'),
        backgroundColor: AppsColors.background,
        foregroundColor: AppsColors.textPrimary,
        actions: [
          if (_enviando)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
      body: _error.isNotEmpty
          ? Center(child: Text(_error))
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _buildProveedorSelector(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _buildListaProductos(),
                  ),
                  const SizedBox(height: 8),
                  _buildTotalYBoton(),
                ],
              ),
            ),
    );
  }

  Widget _buildProveedorSelector() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Proveedor',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            if (_loadingProveedores)
              const Center(child: CircularProgressIndicator())
            else
              DropdownButtonFormField<Proveedor>(
                value: _proveedorSeleccionado,
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Selecciona un proveedor',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  isDense: true,
                ),
                items: _proveedores.map((proveedor) {
                  return DropdownMenuItem<Proveedor>(
                    value: proveedor,
                    child: Text(
                      proveedor.nombreEmpresa,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
                onChanged: (proveedor) {
                  setState(() {
                    _proveedorSeleccionado = proveedor;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildListaProductos() {
    return Card(
      elevation: 4,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Productos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _agregarProducto,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text(
                    'Agregar',
                    style: TextStyle(fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (_detalles.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, size: 50, color: Colors.grey[400]),
                      const SizedBox(height: 8),
                      const Text(
                        'No hay productos agregados',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: _detalles.length,
                  itemBuilder: (context, index) {
                    final detalle = _detalles[index];
                    final producto = _productos.firstWhere(
                      (p) => p.idProducto == detalle.idProducto,
                      orElse: () => Producto(
                        idProducto: 0,
                        idProveedor: 0,
                        idCategoria: 0,
                        idUnidadMedida: 0,
                        idMarca: 0,
                        idPresentacion: 0,
                        nombre: 'Producto no encontrado',
                        descripcion: '',
                        estado: true,
                        idLote: 0,
                        imagen: '',
                      ),
                    );
                    
                    return _buildProductoItem(detalle, producto, index);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductoItem(DetalleCompraItem detalle, Producto producto, int index) {
    final subtotal = detalle.cantidad * detalle.precioUnitario;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              radius: 18,
              child: const Icon(Icons.inventory_2, color: Colors.blue, size: 16),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Cantidad: ${detalle.cantidad}',
                    style: const TextStyle(fontSize: 11),
                  ),
                  Text(
                    'Precio: C\$${detalle.precioUnitario.toStringAsFixed(2)} c/u',
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: Text(
                    'C\$${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 18),
                  padding: const EdgeInsets.all(2),
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  onPressed: () => _eliminarProducto(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalYBoton() {
    return Card(
      elevation: 4,
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'C\$${_totalCompra.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _enviando ? null : _guardarCompra,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppsColors.background,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _enviando
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'Guardar Compra',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductoDialog extends StatefulWidget {
  final List<Producto> productos;
  final Function(Producto, int, double) onAgregar;

  const _ProductoDialog({
    required this.productos,
    required this.onAgregar,
  });

  @override
  State<_ProductoDialog> createState() => __ProductoDialogState();
}

class __ProductoDialogState extends State<_ProductoDialog> {
  Producto? _productoSeleccionado;
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Producto'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<Producto>(
              value: _productoSeleccionado,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Producto',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: widget.productos.map((producto) {
                return DropdownMenuItem<Producto>(
                  value: producto,
                  child: Text(
                    producto.nombre,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (producto) {
                setState(() {
                  _productoSeleccionado = producto;
                });
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _cantidadController,
              decoration: const InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _precioController,
              decoration: const InputDecoration(
                labelText: 'Precio Unitario',
                border: OutlineInputBorder(),
                prefixText: 'C\$',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _agregarProducto,
          child: const Text('Agregar'),
        ),
      ],
    );
  }

  void _agregarProducto() {
    if (_productoSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un producto')),
      );
      return;
    }

    final cantidad = int.tryParse(_cantidadController.text) ?? 0;
    final precio = double.tryParse(_precioController.text) ?? 0.0;

    if (cantidad <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa una cantidad válida')),
      );
      return;
    }

    if (precio <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingresa un precio válido')),
      );
      return;
    }

    widget.onAgregar(_productoSeleccionado!, cantidad, precio);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _cantidadController.dispose();
    _precioController.dispose();
    super.dispose();
  }
}