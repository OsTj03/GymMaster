import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/producto_modelo.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';

class ProductService {
  final Dio _dio;
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  ProductService() : _dio = Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:5132/api',
    headers: {'Accept': 'application/json'},
  ));

  Future<List<Producto>> getProducts() async {
    final token = await _authRepository.getToken();
    
    if (token == null) {
      throw Exception("Token de autenticación no encontrado");
    }

    final Response response = await _dio.get(
      '/Producto/GetAll',
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
        .map((json) => Producto.fromJson(json))
        .toList();
  }
}