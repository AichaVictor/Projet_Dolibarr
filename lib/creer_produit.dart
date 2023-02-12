import 'package:flutter/material.dart';
class Product {
  String name;
  double price;
  int stock;

  Product(this.name, this.price, this.stock);

  void updateStock(int quantity) {
    stock += quantity;
  }

  String getInfo() {
    return "$name coûte $price€ et il en reste $stock en stock.";
  }
}

void main() {
  Product product = Product("Ordinateur portable", 999, 10);
  print(product.getInfo());
  product.updateStock(-3);
  print(product.getInfo());
}
