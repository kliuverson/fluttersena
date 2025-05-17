part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> props() {
    // TODO: implement props
    throw UnimplementedError();
  }
}

final class HomeSearchPressed extends HomeEvent {}
