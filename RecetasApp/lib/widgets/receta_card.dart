import 'package:flutter/material.dart';
import '../models/receta.dart';

class RecetaCard extends StatelessWidget {
  final Receta receta;
  final VoidCallback onTap;

  const RecetaCard({super.key, required this.receta, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            receta.imagenUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
          ),
        ),
        title: Text(receta.nombre),
        subtitle: Text(
          '${receta.tiempoTotal} min · ${receta.calificacion.toStringAsFixed(1)}',
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}