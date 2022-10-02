import 'package:flutter/material.dart';
import 'package:mini_pokedex/parent_route.dart';
import 'package:mini_pokedex/poke_route.dart';

class MainMenuRoute extends StatelessWidget {
  const MainMenuRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Get Pokemon Parent View'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ParentRoute()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Get Pokemon Kids View'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PokeRoute()),
              );
            },
          ),
        ],
      ),
    );
  }
}
