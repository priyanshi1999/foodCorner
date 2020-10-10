import 'package:flutter/material.dart';
import 'package:food_corner/dummy_data.dart';
import 'package:food_corner/screens/categories_screen.dart';
import 'package:food_corner/screens/category_meals_screen.dart';
import 'package:food_corner/screens/filters_screen.dart';
import 'package:food_corner/screens/meal_detail_screen.dart';
import 'package:food_corner/screens/tabs_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map <String,bool> _filters={
    'gluten':false,
    'vegan':false,
    'vegetarian':false,
    'lactose':false,
  };


  //when the app starts _availableMeals is just a pointer to the entire DUMMY_MEALS.
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];
  
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      //we are overriding the '_filters' map with 'filterData' map
      _filters = filterData;
      //When we will apply filters then we want to extract the required meals from DUMMY_MEALS in _availableMeals
      //we will return false if we don't want an item to be included in the newly generated list.
      _availableMeals=DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          //if the meal is not gluten free we will exclude it.
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          //if the meal is not gluten free we will exclude it.
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          //if the meal is not gluten free we will exclude it.
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          //if the meal is not gluten free we will exclude it.
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    //we will check first whether the meal is already added into the favorite list or not.
    final existingIndex=_favoriteMeals.indexWhere((meal) => meal.id == mealId);
    //if it is equal that is the meal is already present, we will remove it. But if it returns false(-1)
    //then we will add the meal.
    if(existingIndex>=0){
      //we will remove the meal
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    //if the meal we are looking at is a favorite
    //any returns true if we find any element that meets this condition and then stops.
    return _favoriteMeals.any((meal) => meal.id==id);
  }

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

      //home: TabsScreen(),
      initialRoute: '/',

      routes: {
        //we want to send the list of favoriteMeals to favoritesScreen. But we do not have route of 
        //favoriteScreen here. But we do have a route to the tabs screen which in turn consists of the
        //favorite screen.
        '/' : (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routName : (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        //We do not want the value of filters to be initialized to false every time so
        //we will also send the current applied filters '_filters' to the filtersScreen so that when we go
        //back to the filtersScreen we can see the applied filters there.
        FiltersScreen.routName : (ctx) => FiltersScreen(_filters,_setFilters)
      },

      onGenerateRoute: (settings){
        print(settings.arguments);
        //return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },

      //if none of the routes are written, neither home, nor CategoryMealsScreen, MealDetailScreen and 
      //onGenerateRoute then flutter in the end will check for onUnknownRoute before throwing an error.
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
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