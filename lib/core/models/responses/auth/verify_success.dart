class VerifyCodeResponse {
  final String token;
  final String message;

  VerifyCodeResponse({
    required this.token,
    required this.message,
  });

  // Factory constructor to create an instance from a JSON map
  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifyCodeResponse(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
    );
  }

  // Method to convert the object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'message': message,
    };
  }
}
