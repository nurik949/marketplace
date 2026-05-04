import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/reviews_model.dart';

class review_Screen extends StatefulWidget {
  const review_Screen({super.key});

  @override
  State<review_Screen> createState() => _review_ScreenState();
}

class _review_ScreenState extends State<review_Screen> {
  Future<List<ReviewsModel>> fetchReviews() async {
    final response = await Supabase.instance.client
        .from('description')
        .select();

    return (response as List)
        .map((review) => ReviewsModel.fromJson(review))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
