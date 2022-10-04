import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke/models/pokemon.dart';
import 'package:poke/models/pokemon_list.dart';

class ApiService {
  static Future<List> fetchPokemonList({int limit = 20}) async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final pokemonList = PokemonSearchResult.fromJson(json);
      return [pokemonList, 200];
    } else {
      return [null, response.statusCode];
    }
  }

  static Future<List> fetchPokemon({required String url}) {
    final uri = Uri.parse(url);
    return http.get(uri).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final pokemon = Pokemon.fromJson(json);
        return [pokemon, 200];
      } else {
        return [null, response.statusCode];
      }
    });
  }
}
