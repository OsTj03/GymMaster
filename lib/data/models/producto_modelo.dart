// Archivo: data/models/producto_model.dart

class Producto {
  final int idProducto;
  final int idProveedor;
  final int idCategoria;
  final int idUnidadMedida;
  final int idMarca;
  final int idPresentacion;
  final String nombre;
  final String descripcion;
  final int precio;

  Producto({
    required this.idProducto,
    required this.idProveedor,
    required this.idCategoria,
    required this.idUnidadMedida,
    required this.idMarca,
    required this.idPresentacion,
    required this.nombre,
    required this.descripcion,
    required this.precio,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      idProducto: json['id_Producto'] as int,
      idProveedor: json['id_Proveedor'] as int,
      idCategoria: json['id_Categoria'] as int,
      idUnidadMedida: json['id_UnidadMedida'] as int,
      idMarca: json['id_Marca'] as int,
      idPresentacion: json['id_Presentacion'] as int,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String,
      precio: json['precio'] as int, 
    );
  }
}