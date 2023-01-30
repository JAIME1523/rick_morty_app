import 'package:catalogo_juegos/api/api_character.dart';
import 'package:catalogo_juegos/model/episodes/episodes_response.dart';

class GetEpisodeservice {

  static Future<EpisodesResponse> getPageCharacter() async {
    final resp = await ApiCharacter.httpGet(
        'https://rickandmortyapi.com/api/episode');
    return EpisodesResponse.fromMap(resp);
  }

 static Future<EpisodesResponse> nextPage(String url) async {
    final resp = await ApiCharacter.httpGet(url);
    return EpisodesResponse.fromMap(resp);
  }
}