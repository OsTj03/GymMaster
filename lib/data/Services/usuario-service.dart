// lib/data/services/usuario_service.dart
import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/usuario-modelo.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';
import 'package:gymmaster/core/config/apiconfig.dart';

class UsuarioService {
  final Dio _dio;
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  UsuarioService() : _dio = Dio(BaseOptions(
    baseUrl: Apiconfig.baseUrl,
    headers: {'Accept': 'application/json'},
  ));

  Future<List<Usuario>> getUsuarios() async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.get(
      '/Usuario/GetAll',
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
        .map((json) => Usuario.fromJson(json))
        .toList();
  }

  Future<bool> crearUsuario(Usuario usuario) async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.post(
      '/Usuario/Register',
      data: usuario.toJsonForRegister(),
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

  Future<bool> eliminarUsuario(int id) async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.delete(
      '/Usuario/Delete',
      queryParameters: {'id': id},
      options: Options(headers: {
        'Authorization': 'Bearer ${token.Secret}',
      }),
    );

    print('Eliminando usuario ID: $id');
    print('Respuesta: ${response.statusCode} - ${response.data}');

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Error ${response.statusCode}: ${response.data}');
    }

    if (response.data is bool) {
      return response.data;
    }
    
    return response.statusCode == 200 || response.statusCode == 204;
  }

  Future<bool> editarUsuario(Usuario usuario) async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.put(
      '/Usuario/Update',
      data: usuario.toJsonForUpdate(),
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