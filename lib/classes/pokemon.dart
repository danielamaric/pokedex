class Pokemon {
  final String name;
  final String flavorText;
  final int baseHappiness;
  final int captureRate;
  final String colorName;
  final String evolvesFromSpeciesName;

  const Pokemon({
    required this.name,
    required this.flavorText,
    required this.baseHappiness,
    required this.captureRate,
    required this.colorName,
    required this.evolvesFromSpeciesName,
  });
/*
"base_happiness":50,
"capture_rate":45,
"color":{"name":"green"
"evolves_from_species":{"name":"bulbasaur"
*/

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<dynamic> flavorTextEntries = json['flavor_text_entries'];

    final Map<String, dynamic> englishFlavorEntry =
        flavorTextEntries.firstWhere((entry) {
      entry as Map<String, dynamic>;

      final Map<String, dynamic> languageData = entry['language'];
      final String languageName = languageData['name'];
      return languageName == 'en';
    });

    final String englishFlavorText = englishFlavorEntry['flavor_text'];
    final Map<String, dynamic> pokemonColor = json['color'];
    final Map<String, dynamic>? evolvesFromSpecies =
        json['evolves_from_species'];

// to avoid silent errors regarding type the variables are created type specifically before returning
    final String name = json['name'];
    final String flavorText = englishFlavorText;
    final int baseHappiness = json['base_happiness'];
    final int captureRate = json['capture_rate'];
    final String colorName = pokemonColor['name'];
    final String evolvesFromSpeciesName =
        evolvesFromSpecies?['name'] ?? 'This pokemon has not evolved yet';
    

    return Pokemon(
      name: name,
      flavorText: flavorText,
      baseHappiness: baseHappiness,
      captureRate: captureRate,
      colorName: colorName,
      evolvesFromSpeciesName: evolvesFromSpeciesName,
    );
  }
}
