import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/service/get_episode_service.dart';
import 'package:flutter/material.dart';

class EpisodeViewProvider extends ChangeNotifier {
  EpisodesResponse? episodesResponse;
  List<EpisodeModel> listEpisode = [];

  getEpisode() async {
    episodesResponse = await GetEpisodeservice.getPageCharacter();
    listEpisode = episodesResponse!.results;
  }

  getNextPageEpisode() async {
    if (episodesResponse!.info.next != null) {
      episodesResponse =
          await GetEpisodeservice.nextPage(episodesResponse!.info.next!);
      listEpisode.addAll(episodesResponse!.results);
    }
  }
}
