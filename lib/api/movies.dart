import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '8281dcd6e5f8982f2acefc4eb9749222';
const String baseUrl = 'https://api.themoviedb.org/3';

/* Código por defecto para TMDB para uso de la API */

class ApiPeliculas {
  static Future<List<dynamic>> getMovies() async {
    var url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    var respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      Map data = jsonDecode(respuesta.body);
      List<dynamic> movies = data['results'];
      return movies;
    } else {
      throw Exception('Fallo al cargar las peliculas populares');
    }
  }
}
