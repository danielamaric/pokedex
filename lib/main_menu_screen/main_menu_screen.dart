import 'package:flutter/material.dart';
import 'package:mini_pokedex/constants/padding.dart';
import 'package:mini_pokedex/main_menu_screen/custom_search_delegate.dart';
import 'package:mini_pokedex/main_menu_screen/random_pokemon_button.dart';

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
