import 'package:flutter/material.dart';

class DetallePelicula extends StatelessWidget {
  final dynamic movie;

  DetallePelicula({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['title'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
              'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              movie['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(movie['overview']),
          ),
        ],
      ),
    );
  }
}
