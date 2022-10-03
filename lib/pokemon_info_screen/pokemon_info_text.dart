import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_pokedex/constants/padding.dart';
import '../classes/pokemon.dart';
import 'package:mini_pokedex/utils/string_extension.dart';

const _colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
];

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

    final randomColorIndex = Random().nextInt(_colors.length);
    final randomColor = _colors[randomColorIndex];

    return Center(
      child: Card(
        elevation: 0,
        color: randomColor.withOpacity(0.15),
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
                padding: const EdgeInsets.only(bottom: padding),
                child: Text(
                  'Base happiness rate: $baseHappiness',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: padding),
                child: Text('Capture rate: $captureRate'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: padding),
                child: Text('Color name: $colorName'),
              ),
              Text('Evolves from: $capitalizedEvolvesFromSpeciesName'),
            ],
          ),
        ),
      ),
    );
  }
}
