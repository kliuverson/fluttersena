import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apk/bloc/home_bloc.dart';
import 'package:test_apk/views/failure_view.dart';
import 'package:test_apk/views/inital_view.dart';
import 'package:test_apk/views/loading_view.dart';
import 'package:test_apk/views/sucess_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        title: 'My APP',
        home: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadSuccess) {
              return Success(ch: state.ch);
            } else if (state is HomeLoadInProgress) {
              return Loading();
            } else if (state is HomeLoadFailure) {
              return Failure(err: state.error);
            }
            return InitialView();
          },
        ),
      ),
    );
  }
}
