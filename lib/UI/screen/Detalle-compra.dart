import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/core/config/apps_colors.dart';
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

    if (mounted) { 
      setState(() {
        _loadingProveedor = false;
      });
    }
  } catch (e) {
    if (mounted) {
      setState(() {
        _loadingProveedor = false;
      });
    }
  }
}
Future<void> _loadProductos() async {
  try {
    final productoService = ProductoService();
    final productos = await productoService.getProductos();

    for (final producto in productos) {
      _productosMap[producto.idProducto] = producto;
    }
    if (mounted) { 
      setState(() {
        _loadingProductos = false;
      });
    }
  } catch (e) {
    if (mounted) {
      setState(() {
        _loadingProductos = false;
      });
    }
  }
}

  String _obtenerNombreProducto(int idProducto) {
    final producto = _productosMap[idProducto];
    return producto?.nombre ?? 'Producto #$idProducto';
  }

  String? _obtenerDescripcionProducto(int idProducto) {
    final producto = _productosMap[idProducto];
    return producto?.descripcion;
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppsColors.primaryA,
    body: (_loadingProveedor || _loadingProductos)
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Detalle de la compra',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppsColors.primaryAccentColor,
                  ),
                ),
                const SizedBox(height: 25),
                
                _buildUnifiedCard(),
              ],
            ),
          ),
  );
}

  Widget _buildUnifiedCard() {
    const dividerSpace = SizedBox(height: 16);
    final cardDivider = Divider(color: AppsColors.primaryAccentColor, thickness: 1);
    
    final internalLabelStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: AppsColors.textPrimary,
    );

    final internalValueStyle = const TextStyle(color: AppsColors.textPrimary);

    return Card(
      color: AppsColors.primary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              'Compra #${widget.compra.idCompra}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppsColors.primaryAccentColor,
              ),
            ),
            const SizedBox(height: 12),
            
            _buildInfoRow(
              'Fecha:',
              '${widget.compra.fechaCompra.day}/${widget.compra.fechaCompra.month}/${widget.compra.fechaCompra.year}',
              labelStyle: internalLabelStyle,
              valueStyle: internalValueStyle,
            ),
            _buildInfoRow(
              'Hora:',
              '${widget.compra.fechaCompra.hour}:${widget.compra.fechaCompra.minute.toString().padLeft(2, '0')}',
              labelStyle: internalLabelStyle,
              valueStyle: internalValueStyle,
            ),
            
            dividerSpace,
            cardDivider,
            
            const Text(
              'Información del Proveedor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppsColors.primaryAccentColor,
              ),
            ),
            const SizedBox(height: 12),
            
            if (_proveedor == null)
              const Text('Proveedor no encontrado', style: TextStyle(color: Colors.red))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Empresa:', _proveedor!.nombreEmpresa, labelStyle: internalLabelStyle, valueStyle: internalValueStyle),
                  _buildInfoRow('Teléfono:', _proveedor!.telefono.toString(), labelStyle: internalLabelStyle, valueStyle: internalValueStyle),
                  _buildInfoRow('Email:', _proveedor!.correo, labelStyle: internalLabelStyle, valueStyle: internalValueStyle),
                  _buildInfoRow('Dirección:', _proveedor!.direccion, labelStyle: internalLabelStyle, valueStyle: internalValueStyle),
                ],
              ),
              
            dividerSpace,
            cardDivider,
            
            const Text(
              'Productos Comprados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppsColors.primaryAccentColor,
              ),
            ),
            const SizedBox(height: 12),
            
            ...widget.compra.detalleCompras.map((detalle) =>
              _buildDetalleItem(detalle)
            ).toList(),
            
            const SizedBox(height: 12),
            cardDivider,
            const SizedBox(height: 8),

            _buildInfoRow(
              'Total General:',
              'C\$${widget.compra.costoTotal.toStringAsFixed(2)}',
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppsColors.primaryAccentColor,
              ),
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

  Widget _buildDetalleItem(DetalleCompra detalle) {
    final nombreProducto = _obtenerNombreProducto(detalle.idProducto);
    final descripcionProducto = _obtenerDescripcionProducto(detalle.idProducto);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppsColors.primaryAccentColor),
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
                  style: const TextStyle(color:AppsColors.primaryAccentColor ,fontWeight: FontWeight.bold),
                ),
                if (descripcionProducto != null && descripcionProducto.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      descripcionProducto,
                      style: TextStyle(color:AppsColors.textPrimary, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 4),
                Text('Cantidad: ${detalle.cantidad}',
                  style: TextStyle(color:AppsColors.primaryAccentColor)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'C\$${detalle.precioUnitario.toStringAsFixed(2)} NIO',
                style: const TextStyle(fontWeight: FontWeight.w500
                  ,color: Colors.blue),
              ),
              const SizedBox(height: 40),
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

  Widget _buildInfoRow(
    String label,
    String value, {
    TextStyle? labelStyle,
    TextStyle? valueStyle,
  }) {
    final defaultLabelStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: AppsColors.primaryAccentColor,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: labelStyle ?? defaultLabelStyle,
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