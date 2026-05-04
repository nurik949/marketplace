import 'package:flutter/material.dart';
import 'package:marketplace/feature/main/model/products_more_model.dart';
import 'package:marketplace/shared/circle_button.dart';

import '../../../shared/size_box_widget.dart';
import '../../../shared/view_all_widget.dart';
import '../model/Products_model.dart';

class Products_more extends StatefulWidget {
  final ProductsModel productsModel;

  const Products_more({super.key, required this.productsModel});

  @override
  State<Products_more> createState() => _Products_moreState();
}

class _Products_moreState extends State<Products_more> {
  String selectedSize = 'S';

  Widget size(String s) {
    bool active = selectedSize == s;

    return GestureDetector(
      onTap: () {
        setState(() => selectedSize = s);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10,left: 5),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: active ? Colors.deepPurpleAccent : Color(0xFF222E34),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            s,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B262C),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: CustomScrollView(
          slivers: [
            MainProductBody(image: widget.productsModel.imageUrl),
            SizesBoxWidget(height: 10),
            PriceBody(
              text: widget.productsModel.text,
              price: widget.productsModel.price,
            ),
            SizesBoxWidget(height: 10),
            ImagesBody(),
            SizesBoxWidget(height: 10),
            ViewAllWidget(title: 'Size', onTap: () {}, text: 'Size Guide'),
            SizesBoxWidget(height: 10),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  'S',
                  'M',
                  'L',
                  'XL',
                  '2XL',
                ].map((e) => size(e)).toList(),
              ),
            ),
            SizesBoxWidget(height: 10),
            DescriptionBody(),
            SizesBoxWidget(height: 10),
            ViewAllWidget(title: 'Reviews', onTap: () {}, text: 'View all'),
            SizesBoxWidget(height: 10),
            ReviewItem(),
            SliverToBoxAdapter(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Pellentesque malesuada eget\nvitae amet...",
                style: TextStyle(color: Color(0xFF8F959E), fontSize: 15),
              ),
            ),
            SizesBoxWidget(height: 10),
            TotalPrice(),
          ],
        ),
      ),
    );
  }
}

class MainProductBody extends StatelessWidget {
  final String image;

  const MainProductBody({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 400,
        width: .infinity,
        color: Colors.grey.shade100,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 250,
                height: 350,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30,right: 25),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleButton(image: 'assets/icons/Bag.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 25),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleButton(
                      image: 'assets/icons/Left.png'
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceBody extends StatelessWidget {
  final String text;
  final int price;

  const PriceBody({super.key, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: .min,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Mens Printed Pullover Hoodie',
                style: TextStyle(color: Color(0xFF8F959E)),
              ),
              Text('Price', style: TextStyle(color: Color(0xFF8F959E))),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: .w600,
                ),
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: .w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImagesBody extends StatelessWidget {
  const ImagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 77,
              width: 77,
              margin: EdgeInsets.only(right: 15, left: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/menchik.png'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SizesBody extends StatelessWidget {
  const SizesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xFF1D1E20),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(right: 15),
              child: Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: .w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: .w600,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'The Nike Throwback Pullover Hoodie is made\nfrom premium French terry fabric that blends a\nperformance feel with Read More...',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: .start,
        children: [
          CircleAvatar(radius: 18),
          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ronald Richards", style: TextStyle(color: Colors.white)),
                Text(
                  "13 Sep, 2020",
                  style: TextStyle(color: Color(0xFF8F959E), fontSize: 11),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),

          Column(
            children: [
              Text("4.8", style: TextStyle(color: Colors.white)),
              Row(
                children: [
                  Icon(Icons.star, size: 12, color: Colors.amber),
                  Icon(Icons.star, size: 12, color: Colors.amber),
                  Icon(Icons.star, size: 12, color: Colors.amber),
                  Icon(Icons.star, size: 12, color: Colors.amber),
                  Icon(Icons.star, size: 12, color: Colors.amber),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: .w600,
                ),
              ),
              Text(
                "\$125",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: .w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9775FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: .w500,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
