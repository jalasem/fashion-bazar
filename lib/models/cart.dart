import 'package:fashion_bazar/models/product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  // list of products for sale
  List<Product> products = [
    Product(
        name: 'Fashion wear',
        description: 'very nice one',
        price: '240',
        imagePath: 'lib/images/men_jacket.png'),
    Product(
        name: 'Men Polo',
        description: 'Amazing wear for men',
        price: '300',
        imagePath: 'lib/images/men_polo.png'),
    Product(
        name: 'Men V-Neck',
        description: 'very nice one',
        price: '240',
        imagePath: 'lib/images/men_vneck.png'),
    Product(
        name: 'Fashion Jacket',
        description: 'Women Fashion Hat',
        price: '240',
        imagePath: 'lib/images/women_fashion_jacket.png'),
    Product(
        name: 'Johny top',
        description: 'Women Johnny top wear',
        price: '150',
        imagePath: 'lib/images/women_johnny_top.png'),
    Product(
        name: 'Rain Jacket',
        description: 'Women Rain Jacket',
        price: '400',
        imagePath: 'lib/images/women_rain_jacket.png'),
    Product(
        name: 'Red top',
        description: 'Women Red top',
        price: '180',
        imagePath: 'lib/images/women_red_top.png'),
    Product(
        name: 'Winter Jacket',
        description: 'Women winter Jacket',
        price: '200',
        imagePath: 'lib/images/women_winter_jacket.png')
  ];

  // list of items in user cart
  List<Product> cartItems = [];

  // get list of items for sale
  List<Product> getProducts() {
    return products;
  }

  // get list of items in cart
  List<Product> getCartItems() {
    return cartItems;
  }

  // adding items to the cart
  void addToCart(Product product) {
    cartItems.add(product);
    notifyListeners();
  }

  // removing items from the cart
  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }

  getCartLength() => cartItems.length;
}
