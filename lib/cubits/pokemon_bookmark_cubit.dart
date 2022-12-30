import 'package:hydrated_bloc/hydrated_bloc.dart';

class PokemonBookmarkCubit extends HydratedCubit<List<String>> {
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

  @override
  List<String> fromJson(Map<String, dynamic> json) =>
      json['value'] as List<String>;

  @override
  Map<String, List<String>> toJson(List<String> state) => {'value': state};
}
