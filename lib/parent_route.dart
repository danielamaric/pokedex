import 'package:flutter/material.dart';
import 'package:mini_pokedex/pokemon_info.dart';


class ParentRoute extends StatelessWidget {
  const ParentRoute({super.key});

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