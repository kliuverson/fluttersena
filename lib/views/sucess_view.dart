import 'package:flutter/material.dart';
import 'package:test_apk/Models/character_model.dart';

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
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final character = results[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(character.image ?? ''),
            ),
            title: Text(character.name ?? 'Sin nombre'),
            subtitle: Text(character.status ?? ''),
          );
        },
      ),
    );
  }
}
