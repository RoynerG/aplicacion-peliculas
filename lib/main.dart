import 'package:aplicacion_peliculas_practica/api/movies.dart';
import 'package:aplicacion_peliculas_practica/pages/detalle_pelicula.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi aplicacion de peliculas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListaPeliculas(),
    );
  }
}

class ListaPeliculas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peliculas populares del momento')),
      body: FutureBuilder<List<dynamic>>(
        future: ApiPeliculas.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                      width: 100,
                      height: 100,
                    ),
                    title: Text(movie['title'], style: TextStyle(fontSize: 13)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallePelicula(
                            movie: movie,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No hay peliculas disponibles 🥹'));
          }
        },
      ),
    );
  }
}
