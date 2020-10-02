import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard
}

enum Affordability{
  Affordable,
  Pricely,
  Luxurious
}

class Meal{
  final String id;
  final List<String> categories;
  final String title;
  //we aren't hardcoding the images. We will be using network images.
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGluttenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
    @required this.id, 
    @required this.categories, 
    @required this.title, 
    @required this.imageUrl, 
    @required this.ingredients, 
    @required this.steps, 
    @required this.duration, 
    @required this.complexity,
    @required this.affordability,
    @required this.isGluttenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian
    );
}