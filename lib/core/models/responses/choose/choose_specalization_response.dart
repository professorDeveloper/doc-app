class Specialization {
  final int id;
  final String name;
  final String description;
  final List<Service> services;
  final int staffCategory;
  final String? image;

  Specialization({
    required this.id,
    required this.name,
    required this.description,
    required this.services,
    required this.staffCategory,
    this.image,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      services: (json['services'] as List)
          .map((serviceJson) => Service.fromJson(serviceJson))
          .toList(),
      staffCategory: json['staff_category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'services': services.map((service) => service.toJson()).toList(),
      'staff_category': staffCategory,
      'image': image,
    };
  }
}

class Service {
  final int id;
  final String name;
  final String price;
  final String description;
  final List<ServiceTimeType> serviceTimeTypes;
  final List<int> specialization;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Service({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.serviceTimeTypes,
    required this.specialization,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'] ?? '',
      price: json['price'],
      description: json['description'],
      serviceTimeTypes: (json['service_time_types'] as List)
          .map((typeJson) => ServiceTimeType.fromJson(typeJson))
          .toList(),
      specialization: json['specialization'] != null
          ? List<int>.from(json['specialization'])
          : [],
      image: json['image'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'service_time_types':
      serviceTimeTypes.map((type) => type.toJson()).toList(),
      'specialization': specialization,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class ServiceTimeType {
  final int id;
  final String name;
  final String price;
  final int? service;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ServiceTimeType({
    required this.id,
    required this.name,
    required this.price,
    this.service,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceTimeType.fromJson(Map<String, dynamic> json) {
    return ServiceTimeType(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      service: json['service'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'service': service,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
