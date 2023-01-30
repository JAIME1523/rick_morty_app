

import 'dart:convert';

class InfoPagesModel {
    InfoPagesModel({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    final int count;
    final int pages;
     String? next;
    final dynamic prev;

    factory InfoPagesModel.fromJson(String str) => InfoPagesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory InfoPagesModel.fromMap(Map<String, dynamic> json) => InfoPagesModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}
