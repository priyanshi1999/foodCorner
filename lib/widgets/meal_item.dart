import 'package:flutter/material.dart';
import 'package:food_corner/models/meal.dart';
import 'package:food_corner/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;

  MealItem({
  @required this.id,
  @required this.title,
  @required this.imageUrl,
  @required this.duration, 
  @required this.complexity, 
  @required this.affordability,
  //@required this.removeItem
  });

  String get complexityHumanReadableForm{

    if(complexity == Complexity.Simple)
    return 'Simple';
    else if(complexity == Complexity.Challenging)
    return 'Challenging';
    else if(complexity == Complexity.Hard)
    return 'Hard';
    else
    return 'Unknown';

  }

  String get affordabilityHumanReadableForm{
    if(affordability ==  Affordability.Affordable)
    return 'Affordable';
    else if(affordability == Affordability.Luxurious)
    return 'Luxurious';
    else if(affordability == Affordability.Pricely)
    return 'Pricely';
    else
    return 'Unknown';
  }

  void selectMeal(BuildContext ctx){
   /*  Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_){
      return MealDetailScreen();
    },
    ),
    ); */
     Navigator.of(ctx).pushNamed(MealDetailScreen.routName, arguments: id)
     //'then' will not be executed once the page is pushed by above 'pushedName'. It will be executed after
     //the page is popped in MealDetailScreen. Here we get the result that has been passed to pop.
     .then((result) {
       print(result);
       if(result!=null){
         //removeItem(result);
       }
     });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ) ,
                  child: Image.network(
                    imageUrl, 
                    height: 250, 
                    width: double.infinity, 
                    fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  //Wrapped the text inside a container so that full text appears on the card.
                  //For that we have defined a fixed width of the container, so that the text remains
                  //contained within it.
                  child: Container(
                    width: 300,
                    color:Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20
                    ),
                    child: Text(
                     title, style: TextStyle(
                       fontSize: 22,
                       color: Colors.white,
                       fontFamily: 'Raleway'
                       ),
                       softWrap: true,
                       overflow: TextOverflow.fade,
                      ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 4),
                      Text(duration.toString()+' min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 4),
                      //Here we want to output the complexity which is a enum in human readable form
                      //and for that we'll make use of a getter
                      Text(complexityHumanReadableForm),
                    ],
                    ),
                     Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      //Here we want to output the complexity which is a enum in human readable form
                      //and for that we'll make use of a getter
                      Text(affordabilityHumanReadableForm),
                    ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}