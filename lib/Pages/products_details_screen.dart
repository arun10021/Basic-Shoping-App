import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_provider.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductsDetailsScreen({super.key, required this.product});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'), centerTitle: true),
      body: Column(
        children: [
          Text(
            widget.product['title'],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'], height: 300),
          ),
          Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              children: [
                Text(
                  '\$ ${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product['sizes'].length,
                    itemBuilder: (context, index) {
                      final size = widget.product['sizes'][index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = index;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor:
                                selectedSize == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Color.fromRGBO(245, 247, 249, 1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if ((widget.product['sizes'] as List).contains(
                        widget.product['sizes'][selectedSize],
                      )) {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addToCart({
                          'id': widget.product['id'],
                          'title': widget.product['title'],
                          'price': widget.product['price'],
                          'imageUrl': widget.product['imageUrl'],
                          'company': widget.product['company'],
                          'size': widget.product['sizes'][selectedSize],
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Product added to cart')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select a size')),
                        );
                      }
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.black),
                    label: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
