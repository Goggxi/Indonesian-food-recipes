import 'package:flutter/material.dart';

Widget itemRecipes(String key, String title,String level, String times, String thumb) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Hero(
            child: Image.network(
              thumb,
              height: 230.0,
              width: double.infinity,
              fit: BoxFit.cover,
              // width: double.infinity,
            ),
            tag: key,
          ),
        ),
        Positioned(
          width: 360,
          left: 10.0,
          bottom: 60.0,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                shadows: [
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ]),
          ),
        ),
        Positioned(
          left: 10.0,
          bottom: 35.0,
          child: Text(
            'Level : ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ]),
          ),
        ),
        Positioned(
          left: 65.0,
          bottom: 35.0,
          child: Text(
            level,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ]),
          ),
        ),
        Positioned(
          left: 10.0,
          bottom: 15.0,
          child: Text(
            'Times : ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ]),
          ),
        ),
        Positioned(
          left: 65.0,
          bottom: 15.0,
          child: Text(
            times,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ]),
          ),
        ),
      ],
    ),
  );
}