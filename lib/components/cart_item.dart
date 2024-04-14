import 'package:fashion_bazar/models/product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final void Function()? onDelete;
  const CartItem({super.key, required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            )));
  }
}
