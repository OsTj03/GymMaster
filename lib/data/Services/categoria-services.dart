import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/categoria-modelo.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';

class CategoriaService {
  final Dio _dio;
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  CategoriaService() : _dio = Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:5132/api',
    headers: {'Accept': 'application/json'},
  ));

  Future<List<Categoria>> getCategorias() async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.get(
      '/CatProd/Get',
      options: Options(headers: {
        'Authorization': 'Bearer ${token.Secret}',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}: ${response.data}');
    }

    if (response.data is! List) {
      throw Exception("Formato de respuesta inesperado");
    }

    return (response.data as List)
        .map((json) => Categoria.fromJson(json))
        .toList();
  }

Future<bool> crearCategoria(Categoria categoria) async {
  final token = await _authRepository.getToken();
  
  if (token == null) {
    throw Exception("Token de autenticación no encontrado");
  }

  final Response response = await _dio.post(
    '/CatProd/Insert',
    data: categoria.toJson(),
    options: Options(headers: {
      'Authorization': 'Bearer ${token.Secret}',
      'Content-Type': 'application/json',
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception('Error ${response.statusCode}: ${response.data}');
  }

  if (response.data is String) {
    return response.data.toLowerCase() == 'true';
  }

  return response.data == true;
}
  // En CategoriaService, corrige el método:
Future<bool> eliminarCategoria(int id) async {
  final token = await _authRepository.getToken();
  
  if (token == null) {
    throw Exception("Token de autenticación no encontrado");
  }

  final Response response = await _dio.delete(
    '/CatProd/Delete',
    queryParameters: {'id': id},
    options: Options(headers: {
      'Authorization': 'Bearer ${token.Secret}',
    }),
  );

  print('🗑️ Eliminando categoría ID: $id'); // Debug
  print('📥 Respuesta: ${response.statusCode} - ${response.data}');

  if (response.statusCode != 200 && response.statusCode != 204) {
    throw Exception('Error ${response.statusCode}: ${response.data}');
  }

  if (response.data is bool) {
    return response.data;
  }
  
  return response.statusCode == 200 || response.statusCode == 204;
}

  // Nuevo método para editar categoría
Future<bool> editarCategoria(Categoria categoria) async {
  final token = await _authRepository.getToken();
  
  if (token == null) {
    throw Exception("Token de autenticación no encontrado");
  }

  final Response response = await _dio.put(
    '/CatProd/Update',
    data: categoria.toJsonForEdit(),
    options: Options(headers: {
      'Authorization': 'Bearer ${token.Secret}',
      'Content-Type': 'application/json',
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 204) {
    throw Exception('Error ${response.statusCode}: ${response.data}');
  }

  return response.data == true;
}
}