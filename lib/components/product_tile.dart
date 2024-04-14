import 'package:fashion_bazar/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final void Function()? addToCart;

  const ProductTile(
      {super.key, required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.only(top: 20),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // shoe image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.imagePath,
              height: 200,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),

          // description
          Text(product.name, style: TextStyle(color: Colors.grey.shade600)),

          //price + details
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text('\$${product.price}',
                        style: TextStyle(color: Colors.grey.shade800)),
                  ],
                ),
                GestureDetector(
                    onTap: addToCart,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ))
              ],
            ),
          ),
          // + button to add to cart
        ],
      ),
    );
  }
}
