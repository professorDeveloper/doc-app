class SendSmsCodeResponse {
  final String detail;

  SendSmsCodeResponse({required this.detail});

  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendSmsCodeResponse(
      detail: json['detail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'detail': detail,
    };
  }
}