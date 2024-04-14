import 'package:fashion_bazar/components/product_tile.dart';
import 'package:fashion_bazar/models/cart.dart';
import 'package:fashion_bazar/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void addToCartSuccess(Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey.shade900,
              title: Text('Successfully added',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade100)),
              content: Text('Check your cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade200)),
              // actions: [
              //   TextButton(
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //       child: const Text('Close'))
              // ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, store, child) => Column(
              children: [
                // search bar
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 20, right: 15, left: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // message
                Text('everyone shines...some shine brighter than others.',
                    style: TextStyle(color: Colors.grey.shade800)),
                // hot picks
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text('Hot Picks 🔥',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      )
                    ],
                  ),
                ),

                // hot picks list
                Expanded(
                    child: ListView.builder(
                  itemCount: store.getProducts().length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 20),
                  itemBuilder: (context, index) {
                    Product product = store.getProducts()[index];

                    return ProductTile(
                      product: product,
                      addToCart: () {
                        store.addToCart(product);
                        addToCartSuccess(product);
                      },
                    );
                  },
                )),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Divider(
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ));
  }
}
