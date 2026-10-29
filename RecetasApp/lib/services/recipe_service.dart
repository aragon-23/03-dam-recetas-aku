import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/receta.dart';

class RecipeService {
  static const String baseUrl = 'https://dummyjson.com/recipes';

  Future<List<Receta>> obtenerRecetas() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Error al cargar recetas: ${response.statusCode}');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> lista = data['recipes'];

    return lista
        .map((j) => Receta.fromJson(j as Map<String, dynamic>))
        .toList();
  }
}