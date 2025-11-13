class DetalleVenta {
  final int idDetalleVenta;
  final int idVenta;
  final int idProducto;
  final int cantidad;
  final double precio;
  final double total;

  DetalleVenta({
    required this.idDetalleVenta,
    required this.idVenta,
    required this.idProducto,
    required this.cantidad,
    required this.precio,
    required this.total,
  });

  factory DetalleVenta.fromJson(Map<String, dynamic> json) {
    return DetalleVenta(
      idDetalleVenta: json['id_DetalleVenta'] ?? 0,
      idVenta: json['id_Venta'] ?? 0,
      idProducto: json['id_Producto'] ?? 0,
      cantidad: json['cantidad'] ?? 0,
      precio: (json['precio'] ?? 0).toDouble(),
      total: (json['total'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_DetalleVenta': idDetalleVenta,
      'id_Venta': idVenta,
      'id_Producto': idProducto,
      'cantidad': cantidad,
      'precio': precio,
      'total': total,
    };
  }
}

class Venta {
  final int idVenta;
  final int idCliente;
  final DateTime fechaVenta;
  final double subtotal;
  final double iva;
  final double descuento;
  final double total;
  final List<DetalleVenta> detalleVenta;

  Venta({
    required this.idVenta,
    required this.idCliente,
    required this.fechaVenta,
    required this.subtotal,
    required this.iva,
    required this.descuento,
    required this.total,
    required this.detalleVenta,
  });

  factory Venta.fromJson(Map<String, dynamic> json) {
    return Venta(
      idVenta: json['id_Venta'] ?? 0,
      idCliente: json['id_Cliente'] ?? 0,
      fechaVenta: DateTime.parse(json['fecha_Venta']),
      subtotal: (json['subtotal'] ?? 0).toDouble(),
      iva: (json['iva'] ?? 0).toDouble(),
      descuento: (json['descuento'] ?? 0).toDouble(),
      total: (json['total'] ?? 0).toDouble(),
      detalleVenta: (json['detalleVenta'] as List)
          .map((detalle) => DetalleVenta.fromJson(detalle))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Venta': idVenta,
      'id_Cliente': idCliente,
      'fecha_Venta': fechaVenta.toIso8601String(),
      'subtotal': subtotal,
      'iva': iva,
      'descuento': descuento,
      'total': total,
      'detalleVenta': detalleVenta.map((detalle) => detalle.toJson()).toList(),
    };
  }
}