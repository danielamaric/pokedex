import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/classes/pokemon.dart';
import 'package:mini_pokedex/cubits/pokemon_bookmark_cubit.dart';

class BookmarkButton extends StatelessWidget {
  final Pokemon pokemon;

  const BookmarkButton({
    required this.pokemon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isBookmarked = context.select(
      (PokemonBookmarkCubit cubit) => cubit.state.contains(pokemon.name),
    );

    return IconButton(
      onPressed: () {
        final pokemonBookmarkCubit = context.read<PokemonBookmarkCubit>();

        if (isBookmarked) {
          pokemonBookmarkCubit.removePokemonName(pokemon.name);
        } else {
          pokemonBookmarkCubit.addPokemonName(pokemon.name);
        }
      },
      icon: Icon(
        isBookmarked ? Icons.favorite : Icons.favorite_border,
      ),
    );
  }
}
