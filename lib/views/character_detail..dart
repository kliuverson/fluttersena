import 'package:flutter/material.dart';

import '../Models/character_model.dart';

class CharacterDetail extends StatelessWidget {
  final Results character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? 'Detalles'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              character.image ?? '',
              height: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.error, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              character.name ?? 'Sin nombre',
              style: const TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            _buildDetail('Estado', character.status),
            _buildDetail('Tipo', character.type),
            _buildDetail('Género', character.gender),
            _buildDetail('Especie', character.species),
            _buildDetail('Origen', character.origin?.name),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : 'Desconocido',
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
