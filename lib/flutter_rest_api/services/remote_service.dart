import 'dart:isolate';

import '../../x_experiment/flutter_lifecycle.dart';
import '../models/pokemon.dart';
import '../models/pokemon_list.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;

import '../models/yugioh_card.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      return postsFromJson(json);
    }
    return null;
  }

  Future<YuGiOh?> getYuGiOh() async {
    var client = http.Client();

    var uri = Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php');
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      xPrint(json);
      return yuGiOhFromJson(json);
    }
    xPrint(respond.statusCode);
    return null;
  }

  Future<PokemonList?> getPokemonList() async {
    var client = http.Client();

    var uri =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
    var respond = await Isolate.run(() {
      return client.get(uri);
    });

    if (respond.statusCode == 200) {
      var json = respond.body;
      xPrint(json);
      return pokemonListFromJson(json);
    }
    xPrint(respond.statusCode);
    return null;
  }

  Future<String?> getPokemon(String usl) async {
    var client = http.Client();
    var uri = Uri.parse(usl);
    var respond = await client.get(uri);
    if (respond.statusCode == 200) {
      var json = respond.body;
      xPrint(json);
      if (pokemonFromJson(json).sprites?.frontDefault == null) {
        return pokemonFromJson(json).sprites?.frontShiny;
      }
      return pokemonFromJson(json).sprites?.frontDefault;
    }
    return null;
  }
}
