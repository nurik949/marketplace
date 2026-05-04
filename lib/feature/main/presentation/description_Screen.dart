import 'package:flutter/material.dart';

class description extends StatelessWidget {
  const description({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B2B34), Color(0xFF0F2027)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white10,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Spacer(),
                    const Text(
                      "Reviews",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("245 Reviews",
                            style: TextStyle(color: Colors.white,fontSize: 20)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text("4.8",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star_border_outlined,color: Colors.orange, size: 16),
                          ],
                        )
                      ],
                    ),

                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9775FA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.edit, size: 16,color: Colors.white,),
                      label: const Text("Add Review",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: const [
                      ReviewItem(
                        name: "Jenny Wilson",
                        rating: 4.8,
                        date: "13 Sep, 2020",
                        image:
                        '',
                      ),
                      ReviewItem(
                        name: "Ronald Richards",
                        rating: 4.8,
                        date: "13 Sep, 2020",
                        image:
                        '',
                      ),
                      ReviewItem(
                        name: "Guy Hawkins",
                        rating: 4.8,
                        date: "13 Sep, 2020",
                        image:
                        '',
                      ),
                      ReviewItem(
                        name: "Savannah Nguyen",
                        rating: 4.8,
                        date: "13 Sep, 2020",
                        image:
                        '',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String name;
  final double rating;
  final String date;
  final String image;

  const ReviewItem({
    super.key,
    required this.name,
    required this.rating,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(image),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    Text("$rating",
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 12, color: Colors.white54),
                    const SizedBox(width: 4),
                    Text(date,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 12)),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        5,
                            (index) => const Icon(Icons.star,
                            size: 14, color: Colors.orange),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}