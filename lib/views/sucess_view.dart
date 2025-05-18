import 'package:flutter/material.dart';
import '../Models/character_model.dart';

class Success extends StatelessWidget {
  final CharactersModel ch;

  const Success({super.key, required this.ch});

  @override
  Widget build(BuildContext context) {
    final results = ch.results;

    if (results == null || results.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Personajes')),
        body: Center(child: Text('No hay personajes')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Personajes')),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Agrega espacio alrededor del grid
        child: GridView.builder(
          itemCount: results.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dos columnas
            crossAxisSpacing: 10, // Espacio horizontal entre tarjetas
            mainAxisSpacing: 10, // Espacio vertical entre tarjetas
            childAspectRatio: 0.75, // Relación ancho/alto de las tarjetas
          ),
          itemBuilder: (context, index) {
            final character = results[index];
            final status = character.status?.toLowerCase();

            // Definimos un color según el estado del personaje
            Color statusColor;
            if (status == 'alive') {
              statusColor = Colors.green;
            } else if (status == 'dead') {
              statusColor = Colors.red;
            } else {
              statusColor = Colors.grey;
            }

            return Card(
              elevation: 5, // Sombra de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      character.image ?? '',
                      height: 150,
                      fit:
                          BoxFit
                              .cover, // Hace que la imagen cubra el ancho del card
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error), // Si la imagen falla
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          character.name ?? 'Sin nombre',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle, size: 10, color: statusColor),
                            const SizedBox(width: 4),
                            Text(
                              character.status ?? '',
                              style: TextStyle(color: statusColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
