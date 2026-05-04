class Products_moreModel {
  final String id;
  final String images_Url;
  final String name;
  final int price;
  final String description;

  Products_moreModel({required this.id,required this.name, required this.price, required this.images_Url, required this.description, });

  factory Products_moreModel.fromJson(Map<String, dynamic> json) {
    return Products_moreModel(
      id: json['id'],
      name: json['text'],
      images_Url: json['images_Url'],
      price: json['price'],
      description: json['description']
    );
  }
}