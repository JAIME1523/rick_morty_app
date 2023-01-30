
import 'dart:convert';

class EpisodesModelCharacter {
    EpisodesModelCharacter({
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

    factory EpisodesModelCharacter.fromJson(String str) => EpisodesModelCharacter.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EpisodesModelCharacter.fromMap(Map<String, dynamic> json) => EpisodesModelCharacter(
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
