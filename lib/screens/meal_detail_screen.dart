import 'package:flutter/material.dart';
import 'package:food_corner/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

static const routName= '/meal-detail';
final Function toggleFavorite;
final Function isFavorite;

MealDetailScreen(this.toggleFavorite,this.isFavorite);

Widget buildMethodForSectionTitle(String sectionTitle){
  return Container(
           margin: EdgeInsets.symmetric(vertical: 10),
           child: Text(
             sectionTitle, 
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
              //style: Theme.of(context).textTheme.title
           ),
         );
}

Widget buildMethodForContainerBox(Widget child){
return Container(
           decoration: BoxDecoration(
             border: Border.all(color: Colors.grey),
             borderRadius: BorderRadius.circular(10)
             ),
             //margin: EdgeInsets.all(10),
             padding: EdgeInsets.all(10),
           height: 200,
           width: 300,
           child: child
           );
}

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //we have got the mealId. Now we want the image of the selected meal. So selected meal is the meal selected
    //by the user. Since from inside DUMMY_MEALS we want to check only the id i.e only one item so we have
    //used "firstWhere".
    final selectedMeal= DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
           Container(
             height:300,
             width: double.infinity,
             child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
           ),
           /* Container(
             margin: EdgeInsets.symmetric(vertical: 10),
             child: Text(
               'Ingredients', 
               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
                //style: Theme.of(context).textTheme.title
             ),
           ), */
           buildMethodForSectionTitle('Ingredients'),
           /* Container(
             decoration: BoxDecoration(
               border: Border.all(color: Colors.grey),
               borderRadius: BorderRadius.circular(10)
               ),
               //margin: EdgeInsets.all(10),
               padding: EdgeInsets.all(10),
             height: 150,
             width: 300, */
             buildMethodForContainerBox(
             ListView.builder(
               itemBuilder: (ctx, index) => Card(
                 color: Color.fromRGBO(211, 211, 211, 1),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                   child: Text(selectedMeal.ingredients[index],
                   ),
                 ),
               ),
               itemCount: selectedMeal.ingredients.length,

             ), 
           ),

          buildMethodForSectionTitle('Steps'),
          buildMethodForContainerBox(
            ListView.builder(
              itemBuilder: (ctx,index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text((index+1).toString()),
                      backgroundColor: Color.fromRGBO(211, 211, 211, 1),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  //Divider() just adds a light grey horizontal lines between different steps.
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
              ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: 
          //Navigator.of(context).pop(mealId);
          () => toggleFavorite(mealId),
         
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
          ),
        ),
    );
  }
}