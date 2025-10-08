import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gymmaster/data/Services/authentication_service.dart';
import 'package:gymmaster/data/models/token.dart';

import '../constants/secure_storage_keys.dart';

class AuthenticationRepository {
  final AuthenticationService _authenticationService = AuthenticationService();
  final storage = FlutterSecureStorage();

  Future<void> login(String email, String password) async {
    final Token token = await _authenticationService.login(email, password);
    await storage.write(
      key: SecureStorageKeys.tokenKey,
      value: jsonEncode(token.toJson()),
    );
  }
  
  Future<Token?> getToken() async {
    final tokenJson = await storage.read(key: SecureStorageKeys.tokenKey);
    if (tokenJson == null) return null;
    
    final Map<String, dynamic> tokenMap = jsonDecode(tokenJson);
    return Token.fromJson(tokenMap);
  }
}
