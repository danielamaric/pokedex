import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/cubits/pokemon_bookmark_cubit.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info_screen.dart';

import '../constants/pokemon_names.dart';

class BookmarkedPokemonButton extends StatelessWidget {
  const BookmarkedPokemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkedPokemonNames = context.select(
      (PokemonBookmarkCubit cubit) => cubit.state,
    );

    return bookmarkedPokemonNames.isNotEmpty
        ? Column(
            children: [
              for (var name in bookmarkedPokemonNames)
                ElevatedButton(
                  onPressed: () {
                    final pokemonNameIndex = pokemonNames.indexOf(name);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonInfoScreen(
                          pokemonIndex: pokemonNameIndex,
                        ),
                      ),
                    );
                  },
                  child: Text(name),
                ),
            ],
          )
        : Container();
  }
}
