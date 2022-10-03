import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_pokedex/classes/pokemon.dart';
import 'package:mini_pokedex/constants/padding.dart';
import 'package:mini_pokedex/main_menu_screen/custom_search_delegate.dart';
import 'package:mini_pokedex/main_menu_screen/random_pokemon_button.dart';
import 'package:http/http.dart' as http;

  Future<Pokemon> fetchPokemon() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon-species/1'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

class MainMenuRoute extends StatelessWidget {
  const MainMenuRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: halfPadding),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RandomPokemonButton(),
          ],
        ),
      ),
    );
  }
}
