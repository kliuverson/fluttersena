import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:test_apk/Models/character_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeLoadInProgress());
      final url = Uri.parse('https://rickandmortyapi.com/api/character');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final character_response = CharactersModel.fromJson(data);
        emit(HomeLoadSuccess(character_response));
      } else {
        final data = json.decode(response.body);
        emit(HomeLoadFailure(data['error']));
      }
    });
  }
}
