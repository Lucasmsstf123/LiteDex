class Pokemon {
  final int id;
  final String name;
  final String image;
  final int hp;
  final int atk;
  final int def;
  final String type1;
  final String type2;

  const Pokemon({required this.id, required this.name, required this.image, required this.hp, required this.atk, required this.def, required this.type1, required this.type2});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['dream_world']['front_default'],
      hp: json['stats'][0]['base_stat'],
      atk: json['stats'][1]['base_stat'],
      def: json['stats'][2]['base_stat'],     
      type1: json['types'][0]['type']['name'],
      type2: json['types'].last['type']['name'],
    );
  }
}
