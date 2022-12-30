import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_pokedex/constants/pokemon_names.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info_screen.dart';
import 'package:mini_pokedex/utils/string_extension.dart';

class CustomSearchDelegate extends SearchDelegate {
  Widget buildItems(BuildContext context) {
    List<String> matchQuery = [];
    for (final pokemonName in pokemonNames) {
      if (pokemonName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(pokemonName);
      }
    }

    return ListView.builder(
      itemCount: min(matchQuery.length, 10),
      itemBuilder: (context, index) {
        final result = matchQuery[index];

        return ListTile(
          onTap: () {
            final int pokemonNameIndex = pokemonNames.indexOf(result);
            close(context, result);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonInfoScreen(
                  pokemonIndex: pokemonNameIndex,
                ),
              ),
            );
          },
          title: Text(result.capitalized),
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildItems(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildItems(context);
  }
}
