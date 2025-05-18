import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:
            StackFit
                .expand, // Hace que la imagen de fondo ocupe toda la pantalla
        children: [
          Image.network(
            'https://scontent.fbaq13-1.fna.fbcdn.net/v/t1.6435-9/101881873_146002693675564_1941454741917346380_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHF_jfdmKaB0xMpTmc-O5COGdS-fXvWip0Z1L59e9aKncxUAg7faxLzEQm6o79gbQTBHZjINXkQY6xYdKGoo4Uo&_nc_ohc=0mERSjbkFlEQ7kNvwG9uMLH&_nc_oc=Adnb5f8AUdO17Gr6AkSwtSKI_UIZVXkqLfvetE_GO8UNnu1-nNqLj3gI3E36AvSjRfE&_nc_zt=23&_nc_ht=scontent.fbaq13-1.fna&_nc_gid=vugTXczlBo-MPh5GHEdKKA&oh=00_AfKgpbnFH7hYyltYREp2BEcpvc3lWlkmsqINLlGONRKg3g&oe=685053A7', //se coloca la imagen que quieras para el fondo
            fit:
                BoxFit
                    .cover, // Ajusta la imagen para que cubra toda la pantalla
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centrado horizontal
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ3N1bWU5aXpzY2Q2ZDk5NW1uYW5veGw5d2lyaDY2N2EyeWp2YzNyMCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/i2tLw5ZyikSFdkeGHT/giphy.gif',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Cargando...',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Para que se vea bien sobre el fondo
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
