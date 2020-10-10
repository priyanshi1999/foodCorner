import 'package:flutter/material.dart';
import 'package:food_corner/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

Widget buildMethodForListTile(IconData icon, String title, Function onTapHandler){
   return ListTile(
            leading: Icon(icon, size:26),
            title: Text(title, style: TextStyle(
              fontSize: 24,
            ),
            ),
            onTap: onTapHandler ,
          );
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            child: Text('Cooking up',
            style: TextStyle( 
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),
              ),
          ),
          SizedBox(height: 20),
         /*  ListTile(
            leading: Icon(Icons.restaurant, size:26),
            title: Text('Meals', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            ),
            onTap: ,
          ), */
          buildMethodForListTile(
            Icons.restaurant, 
            'Meals',
            (){
              Navigator.of(context).pushReplacementNamed('/');
          }
          ),
          buildMethodForListTile(
            Icons.settings, 
            'Filters', 
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          }
          ),
         /*  ListTile(
            leading: Icon(Icons.settings, size:26),
            title: Text('Filters', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            ),
            onTap: , */
          
        ],
      ),
    );
  }
}