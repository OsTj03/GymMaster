import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/token.dart';
import 'package:gymmaster/core/config/apiconfig.dart';

class AuthenticationService
{
  Future<Token> login(String usuario, String password) async {
    // 1. Configuración de Dio
  Dio dio = Dio(BaseOptions(baseUrl: Apiconfig.baseUrl));
    
    String endpoint = '/Usuario/Login';

    final Map<String, String> data = {
      'nombre_Usuario': usuario,
      'contraseña': password,
    };
    
    try {
      final Response response = await dio.post(endpoint, data: data);
      if (response.statusCode != 200) throw Exception('Error en la autenticación: ${response.statusCode} - ${response.data}');

      return Token.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        final errorBody = e.response!.data;
        final apiMessage = errorBody is Map && errorBody.containsKey('mensaje') ? errorBody['mensaje']: 'Respuesta de error no estándar.';

        throw Exception('Error de API (${e.response!.statusCode}): $apiMessage');
      } else {
        throw Exception('Error de conexión de red. Verifica la URL de la API y la configuración de CORS.');
      }
    } catch (e) {
      throw Exception('Error inesperado al iniciar sesión: $e');
    }
  }
}
