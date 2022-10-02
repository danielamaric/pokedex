import 'package:flutter/material.dart';
import 'package:mini_pokedex/pokemon_info.dart';


class PokeRoute extends StatelessWidget {
  const PokeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: PokemonInfo(),
    );
  }
}
