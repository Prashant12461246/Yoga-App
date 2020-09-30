import 'package:flutter/material.dart';

class Product{
  final String image, size, title,description;
  final int prize,  id;
  final Color color;
  Product({
    this.color,
    this.prize,
    this.description,
    this.id,
    this.image,
    this.size,
    this.title,
  });
}

List<Product> products = [
  Product(
    id: 1,
    color: Color(0xFF3D82AE),
    description: "dasdsakfjkakfjhs",
    image: "assets/images/food_dish.jpg",
    prize: 123,
    size: "500g",
    title: "Full Dish",
  ),
  Product(
    id: 2,
    color: Color(0xFF3D82AE),
    description: "dasdsakfjkakfjhs",
    image: "assets/images/food_dish.jpg",
    prize: 123,
    size: "500g",
    title: "Full Dish",
  ),
  Product(
    id: 3,
    color: Color(0xFF3D82AE),
    description: "dasdsakfjkakfjhs",
    image: "assets/images/food_dish.jpg",
    prize: 123,
    size: "500g",
    title: "Full Dish",
  ),
  Product(
    id: 4,
    color: Color(0xFF3D82AE),
    description: "dasdsakfjkakfjhs",
    image: "assets/images/food_dish.jpg",
    prize: 123,
    size: "500g",
    title: "Full Dish",
  ),
  Product(
    id: 5,
    color: Color(0xFF3D82AE),
    description: "dasdsakfjkakfjhs",
    image: "assets/images/food_dish.jpg",
    prize: 123,
    size: "500g",
    title: "Full Dish",
  ),
];