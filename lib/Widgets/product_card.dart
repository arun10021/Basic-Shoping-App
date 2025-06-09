import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
          Text('\$ $price', style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 5),
          Center(child: Image.asset(imageUrl, height: 175)),
        ],
      ),
    );
  }
}
