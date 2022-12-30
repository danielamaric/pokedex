import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/classes/pokemon.dart';

class PokemonBookmarkCubit extends Cubit<Pokemon?> {
  PokemonBookmarkCubit() : super(null);

  void addPokemon(Pokemon pokemon) {
    removePokemon();
    return emit(pokemon);
  }

  void removePokemon() => emit(null);
}
