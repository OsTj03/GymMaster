import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/compra-modelo.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';
import 'package:gymmaster/core/config/apiconfig.dart';

class CompraService {
  final Dio _dio;
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  CompraService() : _dio = Dio(BaseOptions(
    baseUrl: Apiconfig.baseUrl,
    headers: {'Accept': 'application/json'},
  ));

  Future<List<RegistroDeCompra>> getCompras() async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.get(
      '/Compras/Get',
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
        .map((json) => RegistroDeCompra.fromJson(json))
        .toList();
  }

  // metodo para crear una compra
Future<bool> createCompra(Compra compra) async {
  final token = await _authRepository.getToken();
  
  if (token == null) {
    throw Exception("Token de autenticación no encontrado");
  }

  final Response response = await _dio.post(
    '/Compras/Insert',
    data: compra.toJson(),
    options: Options(headers: {
      'Authorization': 'Bearer ${token.Secret}',
      'Content-Type': 'application/json',
    }),
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception('Error ${response.statusCode}: ${response.data}');
  }

  return response.data == true;}
}