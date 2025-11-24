// lib/data/models/usuario_modelo.dart
class Usuario {
  final int idUsuario;
  final String nombreUsuario;
  final String contrasena;
  final bool estadoUsuario;
  final List<UserRole> userRoles;

  Usuario({
    required this.idUsuario,
    required this.nombreUsuario,
    required this.contrasena,
    required this.estadoUsuario,
    required this.userRoles,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['id_Usuario'] ?? 0,
      nombreUsuario: json['nombre_Usuario'] ?? '',
      contrasena: json['contraseña'] ?? '', 
      estadoUsuario: json['estado_Usuario'] ?? false,
      userRoles: (json['userRoles'] as List? ?? [])
          .map((roleJson) => UserRole.fromJson(roleJson))
          .toList(),
    );
  }

  //registrar usuario
  Map<String, dynamic> toJsonForRegister() {
    return {
      'nombre_Usuario': nombreUsuario,
      'contrasena': contrasena,
      'estado': estadoUsuario,
    };
  }

  //Update
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id_Usuario': idUsuario,
      'nombre_Usuario': nombreUsuario,
      'contraseña': contrasena, 
      'estado_Usuario': estadoUsuario,
      'userRoles': userRoles.map((role) => role.toJson()).toList(),
    };
  }

  //eliminar usuario
  Map<String, dynamic> toJsonForDelete() {
    return {
      'id_Usuario': idUsuario,
    };
  }
}

class UserRole {
  final int idUsuario;
  final String usuario;
  final int idRol;
  final Rol rol;

  UserRole({
    required this.idUsuario,
    required this.usuario,
    required this.idRol,
    required this.rol,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      idUsuario: json['id_Usuario'] ?? 0,
      usuario: json['usuario'] ?? '',
      idRol: json['id_Rol'] ?? 0,
      rol: Rol.fromJson(json['rol'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Usuario': idUsuario,
      'usuario': usuario,
      'id_Rol': idRol,
      'rol': rol.toJson(),
    };
  }
}

class Rol {
  final int idRol;
  final String nombreRol;
  final String descripcion;
  final List<String> userRoles;

  Rol({
    required this.idRol,
    required this.nombreRol,
    required this.descripcion,
    required this.userRoles,
  });

  factory Rol.fromJson(Map<String, dynamic> json) {
    return Rol(
      idRol: json['id_Rol'] ?? 0,
      nombreRol: json['nombre_Rol'] ?? '',
      descripcion: json['descripción'] ?? '',
      userRoles: (json['userRoles'] as List? ?? []).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_Rol': idRol,
      'nombre_Rol': nombreRol,
      'descripción': descripcion,
      'userRoles': userRoles,
    };
  }
}