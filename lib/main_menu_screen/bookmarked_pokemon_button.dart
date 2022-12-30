import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/constants/pokemon_names.dart';
import 'package:mini_pokedex/cubits/pokemon_bookmark_cubit.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info_screen.dart';

class BookmarkedPokemonButton extends StatelessWidget {
  const BookmarkedPokemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonName = context.select(
      (PokemonBookmarkCubit cubit) => cubit.state?.name,
    );

    return pokemonName != null
        ? ElevatedButton(
            onPressed: () {
              final pokemonNameIndex = pokemonNames.indexOf(pokemonName);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonInfoScreen(
                    pokemonIndex: pokemonNameIndex,
                  ),
                ),
              );
            },
            child: Text(pokemonName),
          )
        : Container();
  }
}
