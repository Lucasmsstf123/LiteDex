import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litedex/model/pokemon.dart';

class PokemonInfo extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: showInformation(context),
    );
  }

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name.toUpperCase());
    } else {
      return const Text("Pokémon não encontrado...");
    }
  }

  Flex showInformation(BuildContext context) {
    if (pokemon != null) {
      return pokemonInfoScreen(context);
    } else {
      return noInfoScreen();
    }
  }

  Color colorType() {
    if (pokemon?.type1 == "grass") {
      return Color.fromARGB(255, 25, 255, 33);
    }
    if (pokemon?.type1 == "fire") {
      return Color.fromARGB(255, 255, 145, 34);
    }
    if (pokemon?.type1 == "water") {
      return Colors.blueAccent;
    }
    if (pokemon?.type1 == "rock") {
      return Color.fromARGB(255, 138, 100, 86);
    }
    if (pokemon?.type1 == "poison") {
      return Color.fromARGB(255, 173, 99, 186);
    }
    if (pokemon?.type1 == "flying") {
      return Color.fromARGB(255, 126, 214, 255);
    }
    if (pokemon?.type1 == "electric") {
      return Color.fromARGB(255, 230, 213, 67);
    }
    if (pokemon?.type1 == "fighting") {
      return Color.fromARGB(255, 184, 72, 72);
    }
    if (pokemon?.type1 == "dark") {
      return Color.fromARGB(255, 110, 96, 237);
    }
    if (pokemon?.type1 == "dragon") {
      return Color.fromARGB(255, 84, 255, 252);
    }
    if (pokemon?.type1 == "fairy") {
      return Color.fromARGB(255, 195, 59, 150);
    }
    if (pokemon?.type1 == "ground") {
      return Color.fromARGB(255, 191, 149, 33);
    }
    if (pokemon?.type1 == "ice") {
      return Color.fromARGB(255, 165, 244, 255);
    }
    if (pokemon?.type1 == "psychic") {
      return Color.fromARGB(255, 255, 5, 234);
    }
    if (pokemon?.type1 == "steel") {
      return Color.fromARGB(255, 19, 255, 145);
    }
    if (pokemon?.type1 == "bug") {
      return Color.fromARGB(255, 80, 183, 66);
    }
    if (pokemon?.type1 == "ghost") {
      return Color.fromARGB(255, 163, 65, 255);
    }
    return Color.fromARGB(255, 196, 196, 196);
  }

  Row pokemonInfoScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: SvgPicture.network(
                  '${pokemon?.image}',
                  fit: BoxFit.scaleDown,
                ),
                width: MediaQuery.of(context).size.width - 100,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: colorType(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "-#${pokemon?.id}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "#${pokemon?.name}",
                      style: const TextStyle(
                        fontSize: 64.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "-HP: ${pokemon?.hp}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    LinearProgressIndicator(
                      value: (((pokemon?.hp)==null? 1 : pokemon?.hp)!/255),
                      semanticsLabel: 'Linear progress indicator',
                      backgroundColor: Colors.grey,
                    ),
                    Text(
                      "-ATK: ${pokemon?.atk}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    LinearProgressIndicator(
                      value: (((pokemon?.atk)==null? 1 : pokemon?.atk)!/160),
                      semanticsLabel: 'Linear progress indicator',
                      color: Colors.yellowAccent,
                      backgroundColor: Colors.grey,
                    ),
                    Text(
                      "-DEF: ${pokemon?.def}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    LinearProgressIndicator(
                      value: (((pokemon?.def)==null? 1 : pokemon?.def)!/230),
                      semanticsLabel: 'Linear progress indicator',
                      color: Colors.lightBlueAccent,
                      backgroundColor: Colors.grey,
                    ),
                    Text(
                      "-Type1: ${pokemon?.type1}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "-Type2: ${pokemon?.type2}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Row noInfoScreen() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Pokémon não encontrado...",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
