import 'package:flutter/material.dart';
import 'package:mini_pokedex/constants/pokemon_names.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info_screen.dart';
import 'dart:math';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying

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
                builder: (context) =>
                    PokemonInfoScreen(pokemonIndex: pokemonNameIndex),
              ),
            );
          },
          title: Text(result),
        );
      },
    );
  }

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return buildItems(context);
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    return buildItems(context);
  }
}
