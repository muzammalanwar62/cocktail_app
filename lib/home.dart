import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'check.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drinkDetail.dart';


const Color mycolor= Colors.teal;
const Color mycolor2 = Colors.lime;

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api= "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res,drinks;
  @override
  void initState() {
    super.initState();
    fetchData();

  }
  fetchData()async{
    res= await http.get(api);
   drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
     backgroundColor: Colors.transparent,
     appBar: AppBar(
       title: Text("Cocktail App"),
       elevation: defaultTargetPlatform == TargetPlatform.iOS ? 5.0 :0.0,
     ),
     drawer: Drawer(
       child: ListView(
         children: <Widget>[
           UserAccountsDrawerHeader(
             accountName: Text("MA"),
             accountEmail: Text("ab@c.com"),
             currentAccountPicture: CircleAvatar(
               backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.blueGrey : Colors.white,
             ),
           ),
           ListTile(
             title: Text("Detail"),
             trailing: Icon(Icons.details),
             onTap: (){
               () => Navigator.of(context).pop();
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Checking("Drawerrrrr")));
//               Navigator.of(context).pushNamed("/a");
             },
           ),
           Divider(),
           ListTile(
             title: Text("Logout"),
             trailing: Icon(Icons.arrow_forward),
             onTap: () => Navigator.of(context).pop(),
           )

         ],
       ),

     ),
     body: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(colors: [
           mycolor,
           mycolor2
         ])
       ),
       child: Center(
         child:  res != null
             ? ListView.builder(
           itemCount: drinks.length,
             itemBuilder: (context, index){
             var drink= drinks[index];
             return ListTile(
                 leading: Hero(
                   tag: drink["idDrink"],
                   child: CircleAvatar(
                     backgroundImage: NetworkImage(
                       drink["strDrinkThumb"] ??
                           "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                     ),
                   ),
                 ),
               title: Text(
                 "${drink["strDrink"]}",
                 style: TextStyle(
                   fontSize: 22,
                   color: Colors.white,
                 ),
               ),
               subtitle: Text(
               "${drink["idDrink"]}",
               style: TextStyle(
               color: Colors.white,
                 ),
               ),
              onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> drinkDetail(drink: drink) ));
              },
             );
             }

         ):CircularProgressIndicator(),

       ),
     ),

   );
  }
}