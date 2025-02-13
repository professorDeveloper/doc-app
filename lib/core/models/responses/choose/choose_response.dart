class AgeResponse {
  final String id;
  final String name;

  AgeResponse({required this.id, required this.name});

  factory AgeResponse.fromJson(Map<String, dynamic> json) {
    return AgeResponse(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }


  @override
  String toString() {
    return 'AgeResponse{name: $name, id: $id}';
  }

  static List<AgeResponse> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AgeResponse.fromJson(json)).toList();
  }
}
