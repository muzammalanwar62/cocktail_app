import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

const Color mycolor= Colors.teal;
const Color mycolor2 = Colors.lime;
class drinkDetail extends StatelessWidget {
  final drink;

  const drinkDetail
      ({Key key, @required this.drink}) :
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(drink["strDrink"]),
      ),
     body: Container(
       decoration: BoxDecoration(
           gradient: LinearGradient(colors: [
             mycolor,
             mycolor2
           ])),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Hero(
               tag: drink["idDrink"],
               child: CircleAvatar(radius: 100.0,
                 backgroundImage: NetworkImage(
                   drink["strDrinkThumb"] ??
                       "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                 ),
               ),
             ),
            SizedBox(
              height: 30.0,
            ),
             Text(
               "ID: ${drink["idDrink"]}",
               style: TextStyle(
                 color: Colors.white70,
               ),
             ),
             SizedBox(
               height: 30.0,
               width: 10.0,
             ),
             Text(
               "Name: ${drink["strDrink"]}",
               style: TextStyle(
                 fontSize: 22,
                 color: Colors.white70,
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }
}
