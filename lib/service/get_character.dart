import 'package:catalogo_juegos/api/api_character.dart';
import 'package:catalogo_juegos/model/models.dart';


class GetCharacterService {
 static Future<CharactersResponse> getPageCharacter() async {
    final resp = await ApiCharacter.httpGet(
        'https://rickandmortyapi.com/api/character/?page=1');
    return CharactersResponse.fromMap(resp);
  }

 static Future<CharactersResponse> nextPage(String url) async {
    final resp = await ApiCharacter.httpGet(url);
    return CharactersResponse.fromMap(resp);
  }
}
