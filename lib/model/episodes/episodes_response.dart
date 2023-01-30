// To parse this JSON data, do
//
//     final episodesResponse = episodesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:catalogo_juegos/model/models.dart';

class EpisodesResponse {
  EpisodesResponse({
    required this.info,
    required this.results,
  });

  final InfoPagesModel info;
  final List<ResultEpisode> results;

  factory EpisodesResponse.fromJson(String str) =>
      EpisodesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EpisodesResponse.fromMap(Map<String, dynamic> json) =>
      EpisodesResponse(
        info: InfoPagesModel.fromMap(json["info"]),
        results: List<ResultEpisode>.from(
            json["results"].map((x) => ResultEpisode.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class ResultEpisode {
  ResultEpisode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final dynamic airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  factory ResultEpisode.fromJson(String str) =>
      ResultEpisode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultEpisode.fromMap(Map<String, dynamic> json) => ResultEpisode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
