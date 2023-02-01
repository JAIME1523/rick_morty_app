import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/service/service.dart';
import 'package:flutter/widgets.dart';

class SearchQuestionProvider extends ChangeNotifier {
  String name = '';
  String _status = '';
  String gender = '';
  CharactersResponse? characterResponse;
  List<InfoCharacter> listSearch = [];

  search() async {
    if ( name != '' || name != "" || status != '') {
      characterResponse =
          await GetSearchCharacter().search(name, status, gender);
      if (characterResponse != null) {
        listSearch = characterResponse!.results;
      } else {
        listSearch = [];
      }
    }
    notifyListeners();
  }

  nextPage() async {
    if (characterResponse!.info.next != null) {
      characterResponse =
          await GetSearchCharacter.nextPage(characterResponse!.info.next);
      listSearch.addAll(characterResponse!.results);
      notifyListeners();
    } else {
      print('NO mas');
    }
  }

  String get status => _status;

  set status(String value) {
    _status = value;
    notifyListeners();
  }
}
