import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
    return Scaffold(
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
              print(snapshot.error);
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
