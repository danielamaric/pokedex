class Pokemon {
  final String name;
  final String flavorText;

  //final String pokeImg;

  const Pokemon({
    required this.name,
    required this.flavorText,

    //required this.pokeImg,
  });

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

    return Pokemon(
      name: json['name'],
      flavorText: englishFlavorText,
    );
  }
}
