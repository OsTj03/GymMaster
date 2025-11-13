// models/proveedor_model.dart
class Proveedor {
  final int idProveedor;
  final String nombreEmpresa;
  final String nombreTrabajador;
  final String apellidoTrabajador;
  final int telefono;
  final String correo;
  final String direccion;
  final bool estado;

  Proveedor({
    required this.idProveedor,
    required this.nombreEmpresa,
    required this.nombreTrabajador,
    required this.apellidoTrabajador,
    required this.telefono,
    required this.correo,
    required this.direccion,
    required this.estado,
  });

  factory Proveedor.fromJson(Map<String, dynamic> json) {
    return Proveedor(
      idProveedor: json['id_Proveedor'] ?? 0,
      nombreEmpresa: json['nombre_Empresa'] ?? '',
      nombreTrabajador: json['nombre_Trabajador'] ?? '',
      apellidoTrabajador: json['apellido_Trabajador'] ?? '',
      telefono: json['telefono'] ?? 0,
      correo: json['correo'] ?? '',
      direccion: json['direccion'] ?? '',
      estado: json['estado'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Proveedor': idProveedor,
      'nombre_Empresa': nombreEmpresa,
      'nombre_Trabajador': nombreTrabajador,
      'apellido_Trabajador': apellidoTrabajador,
      'telefono': telefono,
      'correo': correo,
      'direccion': direccion,
      'estado': estado,
    };
  }
}