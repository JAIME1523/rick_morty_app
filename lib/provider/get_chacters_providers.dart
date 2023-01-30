import 'package:catalogo_juegos/service/get_character.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_juegos/model/models.dart';

class GetCharacterProvider extends ChangeNotifier {
  GetCharacterProvider() {
    getCharacter();
  }
  CharactersResponse? characterResponse;
  List<InfoCharacter> listInfo = [];
  List<InfoCharacter> listRecomend = [];

  bool _isLoading = true;

  getCharacter() async {
    characterResponse = await GetCharacterService.getPageCharacter();
    listInfo = characterResponse!.results;
    listRecomend.addAll([
      listInfo[0],
      listInfo[1],
      listInfo[3],
      listInfo[4],
      listInfo[5],
    ]);
    isLoading = false;
  }

  getNextPage() async {
    if (characterResponse!.info.next != null) {
      characterResponse =
          await GetCharacterService.nextPage(characterResponse!.info.next!);
      if (characterResponse!.results.isNotEmpty) {
        listInfo.addAll(characterResponse!.results);
      }
      notifyListeners();
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
