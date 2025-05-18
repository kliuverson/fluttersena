import 'package:flutter/material.dart';
// Importa el modelo CharactersModel donde están los datos de los personajes
import '../Models/character_model.dart';

// Widget stateless que muestra la pantalla de éxito con los personajes
class Success extends StatelessWidget {
  // Recibe un objeto CharactersModel con los datos de los personajes
  final CharactersModel ch;

  // Constructor con parámetro requerido
  const Success({super.key, required this.ch});

  @override
  Widget build(BuildContext context) {
    // Extraemos la lista de personajes (results) del modelo
    final results = ch.results;

    // Si no hay personajes o la lista está vacía, mostramos mensaje
    if (results == null || results.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black, // Fondo negro para toda la pantalla
        appBar: AppBar(
          title: const Text('Personajes'),
          backgroundColor: const Color.fromARGB(
            255,
            243,
            2,
            2,
          ), // AppBar con fondo negro
        ),
        body: const Center(
          child: Text(
            'No hay personajes', // Mensaje cuando no hay datos
            style: TextStyle(color: Colors.white), // Texto blanco
          ),
        ),
      );
    }

    // Si sí hay personajes, construimos la pantalla con un GridView
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro para toda la pantalla
      appBar: AppBar(
        title: const Text('Personajes'),
        backgroundColor: Colors.black, // AppBar negro
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Espacio alrededor del grid
        child: GridView.builder(
          // Número total de personajes que se mostrarán
          itemCount: results.length,
          // Configura el grid para mostrar 2 columnas, con espacios entre items
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dos columnas en el grid
            crossAxisSpacing: 10, // Espacio horizontal entre tarjetas
            mainAxisSpacing: 10, // Espacio vertical entre tarjetas
            childAspectRatio: 0.75, // Proporción ancho/alto de cada tarjeta
          ),
          // Función que construye cada item en la lista
          itemBuilder: (context, index) {
            // Obtenemos el personaje actual en la posición index
            final character = results[index];
            // Tomamos el estado del personaje y lo ponemos en minúsculas para comparar
            final status = character.status?.toLowerCase();

            // Definimos un color para el estado del personaje
            Color statusColor;
            if (status == 'alive') {
              statusColor = Colors.greenAccent; // Verde para vivo
            } else if (status == 'dead') {
              statusColor = Colors.redAccent; // Rojo para muerto
            } else {
              statusColor = Colors.grey; // Gris para otros estados
            }

            // Creamos una tarjeta para mostrar la info del personaje
            return Card(
              color: Colors.grey[900], // Fondo oscuro para la tarjeta
              elevation: 5, // Sombra para dar profundidad
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .stretch, // Para que la imagen ocupe todo el ancho
                children: [
                  // Imagen con bordes redondeados en la parte superior
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      character.image ?? '', // URL de la imagen
                      height: 150, // Altura fija
                      fit:
                          BoxFit
                              .cover, // La imagen cubre todo el espacio sin deformarse
                      // En caso de error al cargar imagen, muestra un icono de error blanco
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.white),
                    ),
                  ),
                  // Espacio para el texto debajo de la imagen
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Nombre del personaje
                        Text(
                          character.name ?? 'Sin nombre',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                Colors.white, // Texto blanco para visibilidad
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 4,
                        ), // Separación entre texto y fila siguiente
                        // Fila que muestra un círculo de color y el estado del personaje
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Círculo que indica el estado (color)
                            Icon(Icons.circle, size: 10, color: statusColor),
                            const SizedBox(
                              width: 4,
                            ), // Espacio entre icono y texto
                            // Texto con el estado del personaje
                            Text(
                              character.status ?? '',
                              style: TextStyle(
                                color: statusColor, // Color según el estado
                                fontWeight: FontWeight.bold,
                              ),
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
