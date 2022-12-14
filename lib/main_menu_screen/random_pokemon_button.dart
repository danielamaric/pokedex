import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_pokedex/constants/pokemon_names.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info_screen.dart';

class RandomPokemonButton extends StatelessWidget {
  const RandomPokemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
      child: const Text('Surprise me with a Pokemon'),
      onPressed: () {
        final randomPokemonIndex = Random().nextInt(pokemonNames.length);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PokemonInfoScreen(pokemonIndex: randomPokemonIndex),
          ),
        );
      },
    );
  }
}
