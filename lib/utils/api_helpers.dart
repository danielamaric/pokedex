String getPokemonImageUrl({required int id}) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

Uri getPokemonDataUri(int pokemonId) =>
    Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId');
