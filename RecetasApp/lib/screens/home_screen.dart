import 'package:flutter/material.dart';
import '../models/receta.dart';
import '../services/recipe_service.dart';
import 'detalle_receta_screen.dart';
import '../widgets/receta_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeService _service = RecipeService();
  late Future<List<Receta>> _futuroRecetas;

  @override
  void initState() {
    super.initState();
    _futuroRecetas = _service.obtenerRecetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recetas')),
      body: FutureBuilder<List<Receta>>(
        future: _futuroRecetas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final recetas = snapshot.data ?? [];
          if (recetas.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          }
          return ListView.builder(
            itemCount: recetas.length,
            itemBuilder: (context, index) {
              final receta = recetas[index];
              return RecetaCard(
                receta: receta,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleRecetaScreen(receta: receta),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}