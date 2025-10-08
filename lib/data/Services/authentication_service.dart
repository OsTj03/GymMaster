import 'package:dio/dio.dart';
import 'package:gymmaster/data/models/token.dart'; // Importado para debugPrint

class AuthenticationService
{
  final String apiUrl = 'http://10.0.2.2:5132/api';

  Future<Token> login(String usuario, String password) async {
    // 1. Configuración de Dio
    Dio dio = Dio(BaseOptions(baseUrl: apiUrl, validateStatus: (status) => status! < 500));
    String endpoint = '/Usuario/Login';
    
    // 2. Datos de la solicitud (coinciden con el esquema de Swagger)
    final Map<String, String> data = {
      'nombre_Usuario': usuario,
      'contraseña': password,
    };
    
    try {
      final Response response = await dio.post(endpoint, data: data);
      if (response.statusCode != 200) throw Exception('Error en la autenticación: ${response.statusCode} - ${response.data}');

      return Token.fromJson(response.data);
    } on DioException catch (e) {
      // 4. Manejo específico de errores de Dio (conexión o respuesta con código 4xx)
      if (e.response != null) {
        // El servidor respondió, pero con un código de error (ej. 401, 404, 500)
        final errorBody = e.response!.data;
        // NOTA: Confirma que tu API usa la clave 'mensaje' para los errores.
        final apiMessage = errorBody is Map && errorBody.containsKey('mensaje') 
                           ? errorBody['mensaje'] 
                           : 'Respuesta de error no estándar.';

        throw Exception('Error de API (${e.response!.statusCode}): $apiMessage');
      } else {
        // Fallo en la conexión de red (el problema inicial de IP/CORS)
        throw Exception('Error de conexión de red. Verifica la URL de la API y la configuración de CORS.');
      }
    } catch (e) {
      // Manejo de cualquier otra excepción
      throw Exception('Error inesperado al iniciar sesión: $e');
    }
  }
}
