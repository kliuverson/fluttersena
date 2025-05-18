import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apk/bloc/home_bloc.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea asegura que el contenido no se superponga con el notch o la barra de estado
      body: SafeArea(
        // Center centra todo el contenido en la pantalla
        child: Center(
          // Padding agrega margen horizontal para que no esté pegado a los bordes
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Solo ocupa el espacio necesario
              children: [
                // Título principal con estilo grande y negrita
                Text(
                  '¡Bienvenido!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16), // Espacio vertical
                // Subtítulo con estilo más pequeño y centrado
                Text(
                  'Presiona el botón para comenzar tu búsqueda.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32), // Más espacio antes del botón
                // Botón con ícono y texto, estilizado
                ElevatedButton.icon(
                  onPressed: () {
                    // Se obtiene el bloc y se dispara el evento de búsqueda
                    final homeBloc = BlocProvider.of<HomeBloc>(context);
                    homeBloc.add(HomeSearchPressed());
                  },
                  icon: const Icon(Icons.search), // Ícono de lupa
                  label: const Text('Buscar'), // Texto del botón
                  // Estilo del botón: padding, bordes redondeados, tamaño del texto
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
