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
  bool _changeView = false;
  bool _showButton = false;

  getCharacter() async {
    characterResponse = await GetCharacterService.getPageCharacter();
    listInfo = characterResponse!.results;
    listRecomend.addAll([
      listInfo[0],
      listInfo[1],
      listInfo[2],
      listInfo[3],
      listInfo[4],
    ]);
    isLoading = false;
  }

  getNextPage() async {
    showButton = false;
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

  bool get changeView => _changeView;

  set changeView(bool value) {
    _changeView = value;
    notifyListeners();
  }

  bool get showButton => _showButton;

  set showButton(bool value) {
    _showButton = value;
    notifyListeners();
  }
}
