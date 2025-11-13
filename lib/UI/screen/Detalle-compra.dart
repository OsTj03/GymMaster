import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/apps_colors.dart';
import 'package:gymmaster/data/Services/servicio_producto.dart';
import 'package:gymmaster/routes.gr.dart';
import '../../data/models/compra-modelo.dart';
import '../../data/models/Proveedor-modelo.dart';
import '../../data/models/producto_modelo.dart';
import '../../data/services/regiscompra-service.dart';
import '../../data/services/Proveedor-services.dart';

@RoutePage()
class CompraDetailPage extends StatefulWidget {
  const CompraDetailPage({super.key, required this.compra});
  
  final RegistroDeCompra compra;

  @override
  State<CompraDetailPage> createState() => _CompraDetailPageState();
}

class _CompraDetailPageState extends State<CompraDetailPage> {
  Proveedor? _proveedor;
  //Aqui se mapean los productos por id para poder obtener el nombre
  final Map<int, Producto> _productosMap = {};
  bool _loadingProveedor = true;
  bool _loadingProductos = true;

  @override
  void initState() {
    super.initState();
    _loadProveedor();
    _loadProductos();
  }

  Future<void> _loadProveedor() async {
    try {
      final proveedorService = ProveedorService();
      final proveedores = await proveedorService.getProveedores();
      
      _proveedor = proveedorService.findProveedorByid(
        proveedores, 
        widget.compra.idProveedor
      );

      setState(() {
        _loadingProveedor = false;
      });
    } catch (e) {
      setState(() {
        _loadingProveedor = false;
      });
    }
  }

  Future<void> _loadProductos() async {
    try {
      final productoService = ProductoService();
      final productos = await productoService.getProductos();

      //se crea mapeo para busqueda rapida por id del productp
      for (final producto in productos) {
        _productosMap[producto.idProducto] = producto;
      }

      setState(() {
        _loadingProductos = false;
      });
    } catch (e) {
      setState(() {
        _loadingProductos = false;
      });
    }
  }

  //metodo donde se obtiene el nombre del producto por id
  String _obtenerNombreProducto(int idProducto) {
    final producto = _productosMap[idProducto];
    return producto?.nombre ?? 'Producto #$idProducto';
  }

  //metodo para obtener la descripcion del producto por id
  String? _obtenerDescripcionProducto(int idProducto) {
    final producto = _productosMap[idProducto];
    return producto?.descripcion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsColors.background,
      appBar: AppBar(
        title: const Text('Detalle de Compra'),
        backgroundColor: AppsColors.accent,
        foregroundColor: Colors.white,
      ),
      body: (_loadingProveedor || _loadingProductos)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(),
                  const SizedBox(height: 20),
                  _buildProveedorCard(),
                  const SizedBox(height: 20),
                  _buildDetallesCard(),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      color: AppsColors.textPrimary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Compra #${widget.compra.idCompra}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppsColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Fecha:', 
              '${widget.compra.fechaCompra.day}/${widget.compra.fechaCompra.month}/${widget.compra.fechaCompra.year}',
              valueStyle: const TextStyle(color: AppsColors.primary)),
            _buildInfoRow('Hora:', 
              '${widget.compra.fechaCompra.hour}:${widget.compra.fechaCompra.minute.toString().padLeft(2, '0')}',
              valueStyle: const TextStyle(color: AppsColors.primary)),
            const SizedBox(height: 8),
            Divider(color: AppsColors.accent),
            const SizedBox(height: 8),
            _buildInfoRow(
              'Total:',
              'C\$${widget.compra.costoTotal.toStringAsFixed(2)}',
              valueStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProveedorCard() {
    return Card(
      color: AppsColors.textPrimary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información del Proveedor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (_proveedor == null)
              const Text('Proveedor no encontrado', style: TextStyle(color: Colors.red))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Empresa:', _proveedor!.nombreEmpresa, valueStyle: const TextStyle(color: AppsColors.primary)),
                  _buildInfoRow('Teléfono:', _proveedor!.telefono.toString(), valueStyle: const TextStyle(color: AppsColors.primary)),
                  _buildInfoRow('Email:', _proveedor!.correo, valueStyle: const TextStyle(color: AppsColors.primary)),
                  _buildInfoRow('Dirección:', _proveedor!.direccion, valueStyle: const TextStyle(color: AppsColors.primary)),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetallesCard() {
    return Card(
      color: AppsColors.textPrimary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Productos Comprados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...widget.compra.detalleCompras.map((detalle) =>
              _buildDetalleItem(detalle)
            ).toList(),
            const SizedBox(height: 12),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 8),
            _buildInfoRow(
              'Total General:',
              'C\$${widget.compra.costoTotal.toStringAsFixed(2)}',
              valueStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetalleItem(DetalleCompra detalle) {
    final nombreProducto = _obtenerNombreProducto(detalle.idProducto);
    final descripcionProducto = _obtenerDescripcionProducto(detalle.idProducto);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombreProducto,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (descripcionProducto != null && descripcionProducto.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      descripcionProducto,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 4),
                Text('Cantidad: ${detalle.cantidad}'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'C\$${detalle.precioUnitario.toStringAsFixed(2)} NIO',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                'C\$${detalle.subTotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {TextStyle? valueStyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: valueStyle ?? const TextStyle(color: AppsColors.textPrimary),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}