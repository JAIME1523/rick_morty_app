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
    final List<EpisodeModel> results;

    factory EpisodesResponse.fromJson(String str) => EpisodesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EpisodesResponse.fromMap(Map<String, dynamic> json) => EpisodesResponse(
        info: InfoPagesModel.fromMap(json["info"]),
        results: List<EpisodeModel>.from(json["results"].map((x) => EpisodeModel.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}