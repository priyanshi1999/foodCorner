import 'package:flutter/material.dart';
import 'package:food_corner/screens/categories_screen.dart';
import 'package:food_corner/screens/favorites_screen.dart';
import 'package:food_corner/widgets/main_drawer.dart';
import '../models/meal.dart';


//TabsScreen has the goal of rendering the tabs and then appropriate content for each tab depending on which tab
//was selected.
class  TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   //List for outputting the widgets as per the selected tab and also
   //changing the title of the AppBar 
   List <Map<String, Object>> _pages ;

   int _selectedPageIndex=0;

   @override
  void initState() {
    // TODO: implement initState
    _pages= [
    {'page':CategoriesScreen(), 'titleOfAppBar':'Categories'},
    {'page':FavoritesScreen(widget.favoriteMeals), 'titleOfAppBar':'Favorites'},
  ];
    super.initState();
  }

   void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['titleOfAppBar']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color.fromRGBO(211, 211, 211, 1),
        unselectedItemColor: Color.fromRGBO(169, 169, 169, 1),
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        //when we use shifting type BarType then we have to individually specify the backgroundColor
        //in items.
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(211, 211, 211, 1),
            icon: Icon(Icons.category),
            title: Text('Categories'),
            ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(211, 211, 211, 1),
            icon: Icon(Icons.star), 
            title: Text('Favorites'),
            ),
        ],
      ),
    );

    /* 
    //TO ADD TABS TO THE BOTTOM OF THE APPBAR INSTEAD OF THE BOTTOM OF THE SCREEN
    return DefaultTabController(
      //length is to define how many tabs we want to have.
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.category), text: 'Categories'),
            Tab(icon: Icon(Icons.star), text: 'Favorites'),
          ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    ); */
    
  }
}