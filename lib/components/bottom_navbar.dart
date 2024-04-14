import 'package:fashion_bazar/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class MyBottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, store, child) {
      final int cartLength = store.getCartLength();
      final String cartItemCount = cartLength > 0 ? '($cartLength)' : '';

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          color: Colors.grey.shade400,
          activeColor: Colors.grey.shade800,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 16,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            const GButton(
              icon: Icons.home,
              text: ' Shop',
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: 'Cart $cartItemCount',
            ),
          ],
        ),
      );
    });
  }
}
