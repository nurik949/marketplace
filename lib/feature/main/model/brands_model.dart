class BrandsModel {
  final String id;
  final String title;
  final String image;

  BrandsModel({required this.id, required this.title, required this.image});

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      id: json['id'],
      title: json['title'],
      image: json['imageUrl'],
    );
  }
}