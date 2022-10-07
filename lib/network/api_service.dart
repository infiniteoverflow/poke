import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke/key.dart';
import 'package:poke/models/recipe.dart';

class ApiService {
  static Future fetchRecipe({int id = 0}) async {
    final queryParams = {
      'app_id': Key.appId,
      'app_key': Key.applicationKey,
      'type': 'public',
    };
    var response = await http.get(
      Uri.https('api.edamam.com',
          'api/recipes/v2/1b9794df9596fb8a060fb52029db63b0', queryParams),
    );

    RecipeData recipeData = RecipeData.fromJson(
      jsonDecode(response.body),
    );

    print('Recipe fetched : ${recipeData.recipe?.uri}');
  }
}
