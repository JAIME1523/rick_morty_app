import 'package:catalogo_juegos/api/api_character.dart';
import 'package:catalogo_juegos/model/models.dart';

class GetSearchCharacter {
  CharactersResponse? resp;
   Future search(String name, status, gender) async {
    try {
      final resp = await ApiCharacter.httpGet(
          'https://rickandmortyapi.com/api/character/?name=$name&status=$status&gender=$gender');
      return CharactersResponse.fromMap(resp);
    } catch (e) {
      return  resp;
    }
  }

  static Future<CharactersResponse> nextPage(String url) async {
    final resp = await ApiCharacter.httpGet(url);
    return CharactersResponse.fromMap(resp);
  }
}
