import 'dart:convert';

import 'package:catalogo_juegos/model/models.dart';

class CharactersResponse {
    CharactersResponse({
        required this.info,
        required this.results,
    });

    final InfoPagesModel info;
    final List<InfoCharacter> results;

    factory CharactersResponse.fromJson(String str) => CharactersResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CharactersResponse.fromMap(Map<String, dynamic> json) => CharactersResponse(
        info: InfoPagesModel.fromMap(json["info"]),
        results: List<InfoCharacter>.from(json["results"].map((x) => InfoCharacter.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}
