import 'package:built_collection/built_collection.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class PokemonBookmarkCubit extends HydratedCubit<BuiltSet<String>> {
  PokemonBookmarkCubit() : super(BuiltSet.of({}));

  void addPokemonName(String value) {
    final newList = state.rebuild(
      (b) => b.add(value),
    );

    emit(newList);
  }

  void removePokemonName(String value) {
    final newList = state.rebuild(
      (b) => b.remove(value),
    );

    emit(newList);
  }

  @override
  BuiltSet<String> fromJson(Map<String, dynamic> json) => BuiltSet.from(
        json['value'] as List<String>,
      );

  @override
  Map<String, List<String>> toJson(BuiltSet<String> state) => {
        'value': state.toList(),
      };
}
