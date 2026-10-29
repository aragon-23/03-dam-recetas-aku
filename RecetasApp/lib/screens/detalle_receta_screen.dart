import 'package:flutter/material.dart';
import '../models/receta.dart';

class DetalleRecetaScreen extends StatelessWidget {
  final Receta receta;

  const DetalleRecetaScreen({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receta.nombre)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              receta.imagenUrl,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.broken_image, size: 80),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            receta.nombre,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Preparación: ${receta.tiempoPreparacion} min · '
            'Cocción: ${receta.tiempoCoccion} min · '
            'Total: ${receta.tiempoTotal} min',
          ),
          Text('Porciones: ${receta.porciones}'),
          Text('Calorías por porción: ${receta.calorias}'),
          Text('Calificación: ${receta.calificacion.toStringAsFixed(1)}'),
          const Divider(height: 32),
          Text('Ingredientes', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...receta.ingredientes.map((i) => Text('• $i')),
          const Divider(height: 32),
          Text('Instrucciones', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...List.generate(
            receta.instrucciones.length,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('${i + 1}. ${receta.instrucciones[i]}'),
            ),
          ),
        ],
      ),
    );
  }
}