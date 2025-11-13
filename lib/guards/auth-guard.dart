// guards/auth_guard.dart - Sin package externo
import 'package:auto_route/auto_route.dart';
import 'package:gymmaster/data/repositories/authentication_repository.dart';
import 'package:gymmaster/routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthenticationRepository authRepository = AuthenticationRepository();

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = await authRepository.getToken();
    
    if (token != null && token.Secret.isNotEmpty) {
      resolver.next(true);
    } else {
      router.replaceAll([LoginRoute()]);
      resolver.next(false);
    }
  }
}