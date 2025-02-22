
class Diploma {
  final String image;

  const Diploma({required this.image});

  factory Diploma.fromJson(Map<String, dynamic> json) {
    return Diploma(
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'image': image,
  };
}
    