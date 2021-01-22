import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:indonesian_food_recipes/model/RecipesModel.dart';
import 'package:indonesian_food_recipes/widget/itemRecipes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Result>> fetchDataRecipes() async {
    List<Result> data = [];
    String url = 'https://masak-apa.tomorisakura.vercel.app/api/recipes';

    var response = await http.get(url);
    if(response.statusCode == 200){
      Map json = jsonDecode(response.body);
      RecipesModel dataRecipes = RecipesModel.fromJson(json);

      dataRecipes.results.forEach((element) {
        data.add(element);
      });

      return data;
    } else {
      throw Exception('filed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Indonesian Food Recipes'),
        ),
        body: FutureBuilder(
          future: fetchDataRecipes(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              List<Result> listRecipes = snapshot.data;

              return ListView.builder(
                  itemCount: listRecipes?.length ?? 0,
                  itemBuilder: (BuildContext context, int index){
                    var itemRecipe = listRecipes[index];
                    return InkWell(
                      splashColor: Colors.deepOrange,
                      child: itemRecipes(
                          itemRecipe.key,
                          itemRecipe.title,
                          itemRecipe.dificulty,
                          itemRecipe.times,
                          itemRecipe.thumb
                      )
                    );
                  }
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Indonesian Food Recipes'),
//         ),
//         body: Container(
//           child: Center(
//             child: Text("Home Page"),
//           ),
//         ),
//       ),
//     );
//   }
// }
