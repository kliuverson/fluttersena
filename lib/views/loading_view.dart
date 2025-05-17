import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ3N1bWU5aXpzY2Q2ZDk5NW1uYW5veGw5d2lyaDY2N2EyeWp2YzNyMCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/i2tLw5ZyikSFdkeGHT/giphy.gif',
            ),
          ),
          Text('Cargando...'),
        ],
      ),
    );
  }
}
