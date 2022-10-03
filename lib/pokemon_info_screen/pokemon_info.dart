import 'package:flutter/material.dart';
import 'package:mini_pokedex/utils/api_helpers.dart';
import 'package:mini_pokedex/constants/padding.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info_text.dart';
import 'package:mini_pokedex/utils/string_extension.dart';
import 'package:mini_pokedex/classes/pokemon.dart';

class PokemonInfo extends StatelessWidget {
  final int pokemonIndex;
  final Pokemon pokemon;

  const PokemonInfo({
    super.key,
    required this.pokemonIndex,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final capitalizedName = pokemon.name.capitalized;

    return Padding(
      padding: const EdgeInsets.all(doublePadding),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(doublePadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      capitalizedName,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      '#${pokemonIndex + 1}',
                      style: theme.textTheme.titleLarge?.copyWith(fontSize: 30),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Image.network(
                    getPokemonImageUrl(id: pokemonIndex + 1),
                    width: 200,
                  ),
                ),
                PokemonInfoText(pokemon: pokemon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
