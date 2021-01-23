import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:indonesian_food_recipes/model/DetailRecipesModel.dart';
import 'package:http/http.dart' as http;

class DetailRecipesPage extends StatefulWidget {
  final String keyRecipes;

  DetailRecipesPage({this.keyRecipes});

  @override
  _DetailRecipesPageState createState() => _DetailRecipesPageState();
}

class _DetailRecipesPageState extends State<DetailRecipesPage> {

  Future<Results> fetchDetailRecipes(String keyRecipes) async{
    // List<Product> _list = []; ingredient   step
    Results results = Results();
    final response = await http.get('https://masak-apa.tomorisakura.vercel.app/api/recipe/$keyRecipes');

    if(response.statusCode == 200){
      Map json = jsonDecode(response.body);
      DetailRecipesModel data = DetailRecipesModel.fromJson(json);
      results = data.results;
      return results;
    } else {
      throw Exception('filed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Receipe"),
      ),
      body: FutureBuilder(
        future: fetchDetailRecipes(widget.keyRecipes),
        builder: (context, AsyncSnapshot<Results> snapshot){
          var detailRecipes = snapshot.data;
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Center(
                      child: Hero(
                        child: Material(
                          child: detailRecipes.thumb != null? Image.network(detailRecipes.thumb) : Container(),
                        ),
                        tag: '${detailRecipes.title}',
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          '${detailRecipes.title}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          '${detailRecipes.desc}',
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,),
                        )
                    ),
                  ),
                ],
              ),
            );
          }else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}