import 'package:flutter/material.dart';
import 'package:food_corner/widgets/category_item.dart';
//import './models/category.dart';
import 'package:food_corner/dummy_data.dart';


class CategoriesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return 
    /* Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meals',
        style: TextStyle(
          fontWeight: FontWeight.bold
          ),
          ),
      ),
      body : */
      GridView(
        padding: const EdgeInsets.all(25),
      children: 
        DUMMY_CATEGORIES.map(
          (categoryData) => CategoryItem(
          categoryData.title,
          categoryData.id,
          categoryData.color,
        ),
        )
        .toList(),

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 280,
        //childAspectRatio to define how items should be sized regarding their height & width relation
        childAspectRatio: 3/2,
        //crossAxisSpacing & mainAxisSpacingto define how much distance is b/w columns and rows in the grid.
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
        ),
    );
  }
}