import 'package:fashion_bazar/components/cart_item.dart';
import 'package:fashion_bazar/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, store, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // heading
                const Text('My Cart',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          final cartItem = store.getCartItems()[index];

                          return CartItem(
                              product: cartItem,
                              onDelete: () => store.removeFromCart(
                                    cartItem,
                                  ));
                        },
                        itemCount: store.getCartLength())),
              ],
            )));
  }
}
