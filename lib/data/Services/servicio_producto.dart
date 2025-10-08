import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';
import '../models/producto_modelo.dart';
import 'authentication_service.dart'; // Necesita el método getToken

class ProductService {
  // FIX: Aplicamos .trim() para evitar el FormatException
  final String apiUrl = 'http://10.0.2.2:5132/api'.trim();
  final Dio _dio = Dio();

  Future<List<Producto>> getProducts() async {
    // Obtenemos el token de forma síncrona
    final token = await AuthenticationRepository().getToken();

    if (token == null) {
      throw Exception("AUTORIZACIÓN REQUERIDA: Token JWT no encontrado.");
    }

    // ----------------------------------------------------
    // *** PUNTO CLAVE DE DEBUGGING ***
    // Copia este token para verificarlo en Postman o jwt.io
    debugPrint('*** TOKEN ENVIADO ***: $token');
    // ----------------------------------------------------

    final String endpoint = '$apiUrl/Producto/GetAll';

    try {
      final Response response = await _dio.get(
        endpoint,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${token.Secret}', // Formato de cabecera estándar
            'Accept': 'application/json',
          },
          // Permitimos que Dio capture errores 400s/500s para manejar 401
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is List) {
          return (response.data as List)
              .map((json) => Producto.fromJson(json))
              .toList();
        } else {
          throw Exception("Formato de respuesta de API inesperado.");
        }
      } else {
        // Captura otros errores (403 Forbidden, 404 Not Found, etc.)
        throw Exception(
          'Fallo al cargar productos: Código ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // Manejo específico del 401
      if (e.response?.statusCode == 401) {
        throw Exception(
          "Error 401: Autenticación rechazada por el servidor. El token es inválido o expiró.",
        );
      }
      debugPrint('Error de Dio al obtener productos: $e');
      throw Exception('Error de conexión o API: ${e.message}');
    }
  }
}
