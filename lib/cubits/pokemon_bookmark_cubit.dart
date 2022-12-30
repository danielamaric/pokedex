import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBookmarkCubit extends Cubit<List<String>> {
  PokemonBookmarkCubit() : super([]);

  void addPokemonName(String value) {
    final newList = [...state];
    newList.add(value);
    emit(newList);
  }

  void removePokemonName(String value) {
    final newList = [...state];
    newList.remove(value);
    emit(newList);
  }
}
