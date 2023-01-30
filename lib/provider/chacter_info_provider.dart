

import 'package:catalogo_juegos/api/api_character.dart';
import 'package:catalogo_juegos/model/models.dart';
import 'package:flutter/widgets.dart';

class CharacterInfoProvider extends ChangeNotifier {
  CharacterInfoProvider(List espiddios) {
    chacterEpisode = espiddios;
    filtro();
  }
  List? chacterEpisode;
  List<EpisodeModel> listEpisode = [];
  bool _isLoading = true;

  filtro() async {
    chacterEpisode = chacterEpisode!.map((element) {
      element = element
          .toString()
          .replaceAll('https://rickandmortyapi.com/api/episode/', '');
      return element;
    }).toList();
    await getEpisode();
  }

  getEpisode() async {
    try {
      final resp = await ApiCharacter.httpGet(
          'https://rickandmortyapi.com/api/episode/$chacterEpisode');         
   listEpisode = List<EpisodeModel>.from(resp.map((x) => EpisodeModel.fromMap(x)));    
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
