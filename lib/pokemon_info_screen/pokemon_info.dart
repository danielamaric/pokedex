import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_pokedex/api_helpers.dart';
import 'package:mini_pokedex/utils/string_extension.dart';
import 'package:mini_pokedex/classes/pokemon.dart';

class PokemonInfo extends StatefulWidget {
  final int pokemonIndex;

  const PokemonInfo({super.key, required this.pokemonIndex});

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
  }

  int get pokemonId => widget.pokemonIndex + 1;

  Future<Pokemon> fetchPokemon() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId'),
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              FutureBuilder(
                  future: futurePokemon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final pokemon = snapshot.data!;
                      final flavorText = pokemon.flavorText.withoutLinebreaks;
                      final name = pokemon.name;
                      final baseHappiness = pokemon.baseHappiness;
                      final captureRate = pokemon.captureRate;
                      final colorName = pokemon.colorName;
                      final evolvesFromSpecies = pokemon.evolvesFromSpeciesName;

                      return Column(
                        children: [
                          Text(name),
                          Text(flavorText),
                          Text(
                            'Base happiness rate: $baseHappiness',
                            textAlign: TextAlign.start,
                          ),
                          Text('Capture rate: $captureRate'),
                          Text('Color name rate: $colorName'),
                          Text('Evolves from: $evolvesFromSpecies'),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Container();
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Image.network(
                getPokemonImageUrl(id: pokemonId),
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
