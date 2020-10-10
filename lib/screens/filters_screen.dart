import 'package:flutter/material.dart';
import 'package:food_corner/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routName='/filters';
  final Function saveFilters;
  final Map <String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree=false;
  var _vegan=false;
  var _vegetarian=false;
  var _lactoseFree=false;

  @override
  initState(){
    _glutenFree= widget.currentFilters['gluten'];
    _vegan= widget.currentFilters['vegan'];
    _vegetarian= widget.currentFilters['vegetarian'];
    _lactoseFree= widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _builderMethodForFilterSwitches(
    String filterTitle, String subtitleTitle, bool valuee, Function updateValue)
   {
   return SwitchListTile(
     title: Text(filterTitle),
     value: valuee, 
     subtitle: Text(subtitleTitle),
     onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: (){
              final selectedFilters={
               'gluten':_glutenFree,
               'vegan':_vegan,
               'vegetarian':_vegetarian,
               'lactose':_lactoseFree,
              };
              widget.saveFilters(selectedFilters);
             },
          ),
        ],
        ),
        drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.pinkAccent
              ),
              ),
          ),
        /*  Expanded(
           child: ListView(
             children: <Widget>[
               SwitchListTile(
                 title: Text('Gluten Free'),
                 value: _glutenFree, 
                 subtitle: Text('Only include gluten free meals'),
                 onChanged: (newValue){
                   setState(() {
                     _glutenFree=newValue;
                   });
                 },
               ),
             ],
           ),
         ), */
         Expanded(
           child: ListView(
             children: <Widget>[
               _builderMethodForFilterSwitches(
                  'Gluten Free',
                  'Only include gluten free meals',
                   _glutenFree,
                   (newValue){
                     setState(() {
                       _glutenFree=newValue;
                     });
                   }
                   ),
               _builderMethodForFilterSwitches(
                 'Vegan', 
                 'Only include vegan meals',
                  _vegan,
                   (newValue){
                     setState(() {
                       _vegan=newValue;
                     });
                   }
                  ),
               _builderMethodForFilterSwitches(
                 'Vegetarian',
                  'Only include vegetarian meals',
                   _vegetarian,
                   (newValue){
                     setState(() {
                       _vegetarian=newValue;
                     });
                   }
                   ),
               _builderMethodForFilterSwitches(
                 'Lactose Free', 
                 'Only include lactose free meals', 
                 _lactoseFree,
                 (newValue){
                     setState(() {
                       _lactoseFree=newValue;
                     });
                   }
                 ),
             ],
           ),
         ),
        
        ],
      ),
    );
  }
}