import 'package:flutter/material.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info.dart';

class PokemonInfoScreen extends StatelessWidget {
  final int pokemonIndex;

  const PokemonInfoScreen({super.key, required this.pokemonIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pokedex'),
      ),
      body: PokemonInfo(pokemonIndex: pokemonIndex),
    );
  }
}
