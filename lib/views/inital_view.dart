import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apk/bloc/home_bloc.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Texto incial'),
          ElevatedButton(
            onPressed: () {
              final homeBloc = BlocProvider.of<HomeBloc>(context);
              homeBloc.add(HomeSearchPressed());
            },
            child: Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
