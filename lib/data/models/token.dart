class Token {
  final String Secret;
  Token({
    required this.Secret,
  });

  static Token fromJson(Map<String, dynamic> json) {
    return Token(
      Secret: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': Secret,
    };
  }
}
