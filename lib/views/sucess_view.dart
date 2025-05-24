import 'package:flutter/material.dart';
import '../Models/character_model.dart';

import 'character_detail..dart';
// Asegúrate de importar tu nueva vista de detalles

class Success extends StatelessWidget {
  final CharactersModel ch;

  const Success({super.key, required this.ch});

  @override
  Widget build(BuildContext context) {
    final results = ch.results;

    if (results == null || results.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Personajes'),
          backgroundColor: const Color.fromARGB(255, 243, 2, 2),
        ),
        body: const Center(
          child: Text(
            'No hay personajes',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Personajes'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: results.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            final character = results[index];
            final status = character.status?.toLowerCase();

            Color statusColor;
            if (status == 'alive') {
              statusColor = Colors.greenAccent;
            } else if (status == 'dead') {
              statusColor = Colors.redAccent;
            } else {
              statusColor = Colors.grey;
            }

            return InkWell(
              onTap: () {
                //esto es lo que hace navegar entre pantalla
                Navigator.push(
                  context,
                  //esta es una clase que crea una ruta para navegar entre pantallas
                  MaterialPageRoute(
                    //aqui no le estoy pasando un constructor a otro constructor si no que estoy pasando un valor, en este caso el objeto character, desde una pantalla a otra a traves de los constructores de cada widget
                    builder: (context) => CharacterDetail(character: character),
                  ),
                );
              },
              child: Card(
                color: Colors.grey[900],
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              character.name ?? 'Sin nombre',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: statusColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  character.status ?? '',
                                  style: TextStyle(
                                    color: statusColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              character.type?.isNotEmpty == true
                                  ? character.type!
                                  : 'Sin tipo',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              character.gender ?? 'Sin género',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
