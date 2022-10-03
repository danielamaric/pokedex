import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_pokedex/constants/padding.dart';
import '../classes/pokemon.dart';
import 'package:mini_pokedex/utils/string_extension.dart';

const _colorMap = {
  'red': Colors.red,
  'pink': Colors.pink,
  'blue': Colors.blue,
  'green': Colors.green,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'gray': Colors.grey,
  'brown': Colors.brown,
  'white': Colors.white,
  'black': Colors.black,
  'yellow': Colors.yellow,
};

class PokemonInfoText extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonInfoText({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final flavorText = pokemon.flavorText.withoutLinebreaks;
    final baseHappiness = pokemon.baseHappiness;
    final captureRate = pokemon.captureRate;
    final colorName = pokemon.colorName;
    final capitalizedEvolvesFromSpeciesName =
        pokemon.evolvesFromSpeciesName.capitalized;
    final color = _colorMap[colorName] ?? Colors.red;

    return Center(
      child: Card(
        elevation: 0,
        color: color.withOpacity(0.15),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: padding),
                child: Text(
                  flavorText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: halfPadding),
                child: Text(
                  'Base happiness rate: $baseHappiness',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: halfPadding),
                child: Text('Capture rate: $captureRate'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: halfPadding),
                child: Text('Color: $colorName'),
              ),
              Text('Evolves from: $capitalizedEvolvesFromSpeciesName'),
            ],
          ),
        ),
      ),
    );
  }
}
