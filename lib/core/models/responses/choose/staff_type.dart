class StaffType {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final String image;
  final bool isActive;

  StaffType({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.image,
    required this.isActive,
  });


  @override
  String toString() {
    return 'StaffType{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, description: $description, image: $image, isActive: $isActive}';
  } // Factory method to create an instance from JSON
  factory StaffType.fromJson(Map<String, dynamic> json) {
    return StaffType(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      description: json['description'],
      image: json['image'],
      isActive: json['is_active'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'name': name,
      'description': description,
      'image': image,
      'is_active': isActive,
    };
  }
}


// If you are receiving a list of StaffType
List<StaffType> staffTypeListFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => StaffType.fromJson(json)).toList();
}

List<Map<String, dynamic>> staffTypeListToJson(List<StaffType> staffList) {
  return staffList.map((staff) => staff.toJson()).toList();
}
