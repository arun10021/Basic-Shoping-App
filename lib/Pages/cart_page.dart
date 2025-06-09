import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), centerTitle: true),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        content: Text(
                          'Are you sure you want to remove this item from the cart?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(
                                context,
                                listen: false,
                              ).removeFromCart(cartItem);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                );
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
