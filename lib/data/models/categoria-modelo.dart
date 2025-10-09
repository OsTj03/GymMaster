class Categoria {
  final int categoriaID; 
  final String nombreCategoria;
  final String descripcion;
  final bool estado;

  Categoria({
    required this.categoriaID,
    required this.nombreCategoria,
    required this.descripcion,
    required this.estado,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      categoriaID: json['categoriaID'] ?? 0,
      nombreCategoria: json['nombreCategoria'] ?? '',
      descripcion: json['descripcion'] ?? '',
      estado: json['estado'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombreCategoria': nombreCategoria,
      'descripcion': descripcion,
      'estado': estado,
    };
  }
  
  Map<String, dynamic> toJsonForEdit() {
    return {
      'categoriaID': categoriaID,
      'nombreCategoria': nombreCategoria,
      'descripcion': descripcion,
      'estado': estado,
    };
  }
}