import 'package:flutter/material.dart';
import 'package:food_corner/categories_screen.dart';
import 'package:food_corner/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.pinkAccent,
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color:Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize:17,
            fontFamily: 'Raleway',
            color: Colors.white,
            //fontWeight: FontWeight.bold
          ),
        )
      ),
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routName : (ctx) => CategoryMealsScreen()
      },
    );
  }
}

/* class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  } */
//}