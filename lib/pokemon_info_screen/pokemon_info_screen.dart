import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mini_pokedex/utils/api_helpers.dart';
import 'package:mini_pokedex/classes/pokemon.dart';
import 'package:mini_pokedex/pokemon_info_screen/pokemon_info.dart';

class PokemonInfoScreen extends StatefulWidget {
  final int pokemonIndex;

  const PokemonInfoScreen({
    super.key,
    required this.pokemonIndex,
  });

  @override
  State<PokemonInfoScreen> createState() => _PokemonInfoScreenState();
}

class _PokemonInfoScreenState extends State<PokemonInfoScreen> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
  }

  Future<Pokemon> fetchPokemon() async {
    final pokemonId = widget.pokemonIndex + 1;

    final response = await http.get(
      getPokemonDataUri(pokemonId),
    );

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: FutureBuilder(
          future: futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final pokemon = snapshot.data!;
              return PokemonInfo(
                pokemonIndex: widget.pokemonIndex,
                pokemon: pokemon,
              );
            } else if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
              return Container();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
