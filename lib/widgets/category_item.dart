import 'package:flutter/material.dart';
import 'package:food_corner/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final String title;
  final String id;
  final Color color;
  CategoryItem(this.title, this.id, this.color);

  void selectCategory(BuildContext ctx){
   /*  Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_){
      return CategoryMealsScreen(title,id);
    },
    ),
    ); */

    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routName, arguments: {
      'title':title, 
      'id':id
      }
      );
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      //Ink well gives a ripple effect on being clicked
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      //borderRadius should be equal to the border Radius of the card(BoxDecoration) to nicely get the ripple 
      //effect.
      borderRadius: BorderRadius.circular(15),

        child: Container(
        padding: const EdgeInsets.all(15),
        child: Text( title,
          /* style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color:Colors.white
          ), */
          style: Theme.of(context).textTheme.title,
          ),
        decoration: BoxDecoration(gradient: LinearGradient(colors:[
         color.withOpacity(0.7),
         color,
        ],
        begin: Alignment.topLeft,
        end:Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(15),
        ),
        
      ),
    );
  }
}