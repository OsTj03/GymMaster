class Producto {
  final int idProducto;
  final int idProveedor;
  final int idCategoria;
  final int idUnidadMedida;
  final int idMarca;
  final int idPresentacion;
  final String nombre;
  final String descripcion;
  final bool estado;
  final int idLote;
  final String imagen;

  Producto({
    required this.idProducto,
    required this.idProveedor,
    required this.idCategoria,
    required this.idUnidadMedida,
    required this.idMarca,
    required this.idPresentacion,
    required this.nombre,
    required this.descripcion,
    required this.estado,
    required this.idLote,
    required this.imagen,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      idProducto: json['id_Producto'] ?? 0,
      idProveedor: json['id_Proveedor'] ?? 0,
      idCategoria: json['id_Categoria'] ?? 0,
      idUnidadMedida: json['id_UnidadMedida'] ?? 0,
      idMarca: json['id_Marca'] ?? 0,
      idPresentacion: json['id_Presentacion'] ?? 0,
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      estado: json['estado'] ?? true,
      idLote: json['id_Lote'] ?? 0,
      imagen: json['imagen'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Producto': idProducto,
      'id_Proveedor': idProveedor,
      'id_Categoria': idCategoria,
      'id_UnidadMedida': idUnidadMedida,
      'id_Marca': idMarca,
      'id_Presentacion': idPresentacion,
      'nombre': nombre,
      'descripcion': descripcion,
      'estado': estado,
      'id_Lote': idLote,
      'imagen': imagen,
    };
  }
}