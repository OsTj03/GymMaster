import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/Proveedor-modelo.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';
import 'package:gymmaster/core/config/apiconfig.dart';

class ProveedorService {
  final Dio _dio;
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  ProveedorService() : _dio = Dio(BaseOptions(
    baseUrl: Apiconfig.baseUrl,
    headers: {'Accept': 'application/json'},
  ));

  Future<List<Proveedor>> getProveedores() async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.get(
      '/Proveedor/GetAll',
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
        .map((json) => Proveedor.fromJson(json))
        .toList();
  }
  Proveedor? findProveedorByid(List<Proveedor> proveedores, int id) {
    try {
      return proveedores.firstWhere((proveedor) => proveedor.idProveedor == id);
    } catch (e) {
      return null;
  }
  }
}