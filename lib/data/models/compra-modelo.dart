class DetalleCompra {
  final int idDetalleCompra;
  final int idCompra;
  final int idProducto;
  final int cantidad;
  final double precioUnitario;
  final double subTotal;

  DetalleCompra({
    required this.idDetalleCompra,
    required this.idCompra,
    required this.idProducto,
    required this.cantidad,
    required this.precioUnitario,
    required this.subTotal,
  });

  factory DetalleCompra.fromJson(Map<String, dynamic> json) {
    return DetalleCompra(
      idDetalleCompra: json['id_DetalleCompra'] ?? 0,
      idCompra: json['id_Compra'] ?? 0,
      idProducto: json['id_Producto'] ?? 0,
      cantidad: json['cantidad'] ?? 0,
      precioUnitario: (json['precio_Unitario'] ?? 0).toDouble(),
      subTotal: (json['subTotal'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_DetalleCompra': idDetalleCompra,
      'id_Compra': idCompra,
      'id_Producto': idProducto,
      'cantidad': cantidad,
      'precio_Unitario': precioUnitario,
      'subTotal': subTotal,
    };
  }
}

class RegistroDeCompra {
  final int idCompra;
  final DateTime fechaCompra;
  final double costoTotal;
  final int idProveedor;
  final List<DetalleCompra> detalleCompras;

  RegistroDeCompra({
    required this.idCompra,
    required this.fechaCompra,
    required this.costoTotal,
    required this.idProveedor,
    required this.detalleCompras,
  });

  factory RegistroDeCompra.fromJson(Map<String, dynamic> json) {
    return RegistroDeCompra(
      idCompra: json['id_Compra'] ?? 0,
      fechaCompra: DateTime.parse(json['fecha_Compra']),
      costoTotal: (json['costo_Total'] ?? 0).toDouble(),
      idProveedor: json['id_Proveedor'] ?? 0,
      detalleCompras: (json['detalleCompras'] as List)
          .map((detalle) => DetalleCompra.fromJson(detalle))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Compra': idCompra,
      'fecha_Compra': fechaCompra.toIso8601String(),
      'costo_Total': costoTotal,
      'id_Proveedor': idProveedor,
      'detalleCompras': detalleCompras.map((detalle) => detalle.toJson()).toList(),
    };
  }
}