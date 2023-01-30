import 'package:catalogo_juegos/api/api_character.dart';
import 'package:catalogo_juegos/model/models.dart';
import 'package:flutter/widgets.dart';

class CharcterGridPageProvider extends ChangeNotifier {
  CharcterGridPageProvider(List chatacter) {
    chacterEpisodeList = chatacter;
    filtro();
  }
  bool _isLoading = true;
  List chacterEpisodeList = [];
  List<InfoCharacter> chacterInfo = [];

  filtro() async {
    chacterEpisodeList = chacterEpisodeList.map((element) {
      element = element
          .toString()
          .replaceAll('https://rickandmortyapi.com/api/character/', '');
      return element;
    }).toList();
    print(chacterEpisodeList);
    await getMultipleCharacter();
    //https://rickandmortyapi.com/api/character/1,183
  }

  getMultipleCharacter() async {
    try {
      final resp = await ApiCharacter.httpGet(
          'https://rickandmortyapi.com/api/character/$chacterEpisodeList');
      chacterInfo =
          List<InfoCharacter>.from(resp.map((x) => InfoCharacter.fromMap(x)));
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
