import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/data/authentication_service.dart';
import 'package:gymmaster/routes.gr.dart';
import '../apps_colors.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, Function()? onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthenticationService _authenticationService = AuthenticationService();
  final Map<String, String> formData = {};
  
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future<void> submit() async {
    if (!formState.currentState!.validate()) {
      debugPrint("Formulario no válido. Por favor, corrige");
      return;
    }
    try {
      final String usuario = formData['nombre_Usuario'] ?? '';
      final String password = formData['contraseña'] ?? '';
      await _authenticationService.login(usuario, password);
      
      debugPrint("Inicio de sesión exitoso para: $usuario");
      
      if (mounted) {
        context.router.replace(PantallaRoute());
    }
    }
    on Exception catch (e) {
      debugPrint("Error al iniciar sesión: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 700),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: Offset(0, 50 * (1 - opacity)),
                  child: child,
                ),
              );
            },
            child: Form( 
              key: formState, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Icono del logo
                  Icon(
                    Icons.fitness_center,
                    color: AppsColors.primaryAccentColor,
                    size: 80,
                  ),
                  const SizedBox(height: 16),
                  
                  // Título de la aplicación
                  Text(
                    'GYM MASTER',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppsColors.primaryAccentColor,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 60),

                  _buildTextInput(
                    keyName: 'usuario',
                    labelText: 'Usuario',
                    icon: Icons.person_outline,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  _buildTextInput(
                    keyName: 'contraseña',
                    labelText: 'Contraseña',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submit,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppsColors.accent,
                        backgroundColor: AppsColors.primaryAccentColor,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        shadowColor: AppsColors.primaryAccentColor.withOpacity(0.5),
                      ),
                      child: const Text(
                        'INICIAR SESIÓN',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput({
    required String keyName,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFF444444),
        prefixIcon: Icon(icon, color: AppsColors.primaryAccentColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppsColors.primaryAccentColor, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorStyle: const TextStyle(color: Colors.redAccent),
      ),
      
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, introduce tu $labelText';
        }
        return null;
      },
      
      onChanged: (value) {
        formData[keyName] = value;
      },
    );
  }
}
