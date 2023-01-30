import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/service/get_episode_service.dart';
import 'package:flutter/material.dart';

class EpisodeViewProvider extends ChangeNotifier {
  EpisodeViewProvider() {
    getEpisode();
  }
  EpisodesResponse? episodesResponse;
  List<ResultEpisode> listEpisode = [];

  getEpisode() async {
    episodesResponse = await GetEpisodeservice.getPageCharacter();
    listEpisode = episodesResponse!.results;
    notifyListeners();
  }

  getNextPageEpisode() async {
    if (episodesResponse!.info.next != null) {
      episodesResponse =
          await GetEpisodeservice.nextPage(episodesResponse!.info.next!);
      listEpisode.addAll(episodesResponse!.results);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }


}
