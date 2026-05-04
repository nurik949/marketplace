import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReviewsModel {
  final String id;
  final String userName;
  final String? Avatar;
  final double rating;
  final String description;
  final DateTime createdAt;

  ReviewsModel({
    required this.id,
    required this.userName,
    required this.Avatar,
    required this.rating,
    required this.description,
    required this.createdAt,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
        id: json['id'] as String,
        userName: json['userName'] ?? 'Anonymous',
        Avatar: json['avatar'],
        rating: (json['rating'] as num).toDouble(),
        description: json['description'] ?? '',
        createdAt: DateTime.parse(json['created_at'])
    );
  }
}
