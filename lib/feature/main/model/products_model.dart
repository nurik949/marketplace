import 'package:marketplace/feature/main/model/Products_model.dart' as prefix0;

class ProductsModel {
  final String id;
  final bool isLike;
  final String imageUrl;
  final String text;
  final int price;

  ProductsModel({required this.id, required this.isLike, required this.text, required this.price, required this.imageUrl, });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] ?? 'id',
      text: json['text']?? 'text',
      isLike: json['isLike'] ?? false,
      imageUrl: json['imageUrl'] ?? 'imageUrl',
      price: json['price']?? 12,
    );
  }
}