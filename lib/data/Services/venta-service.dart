import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/venta-modelo.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';
import 'package:gymmaster/core/config/apiconfig.dart';

class VentaService {
  final Dio _dio;
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  VentaService() : _dio = Dio(BaseOptions(
    baseUrl: Apiconfig.baseUrl,
    headers: {'Accept': 'application/json'},
  ));

  Future<List<Venta>> getVentas() async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.get(
      '/Ventas/get',
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
        .map((json) => Venta.fromJson(json))
        .toList();
  }

  Future<bool> crearVenta(Venta venta) async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.post(
      '/Venta',
      data: venta.toJson(),
      options: Options(headers: {
        'Authorization': 'Bearer ${token.Secret}',
        'Content-Type': 'application/json',
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error ${response.statusCode}: ${response.data}');
    }

    return response.data == true;
  }
}