import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routName= '/category-meals';

  /* final String categoryTitle;
  final String categoryId;
  
  CategoryMealsScreen(this.categoryTitle,this.categoryId); */


  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle= routeArgs['title'];
    final categoryId=routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipies'),
      ),
      body:ListView.builder(
        itemBuilder: (ctx, index){
          
        }
      ),
    );
  }
}