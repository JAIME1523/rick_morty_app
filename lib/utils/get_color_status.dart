
import 'package:flutter/material.dart';
import 'package:catalogo_juegos/model/models.dart';

class GetColorStatus {
  static status(status) {
    switch (status) {
      case Status.UNKNOWN:
        return Colors.blue;
      case Status.ALIVE:
        return Colors.green;
      case Status.DEAD:
        return Colors.red;

      default:
        return Colors.purple;
    }
  }

  static gender(status) {
    switch (status) {
      case Gender.UNKNOWN:
        return Colors.amber;
      case Gender.FEMALE:
        return Colors.pink;
      case Gender.MALE:
        return Colors.blueAccent;
      case Gender.GENDERLESS:
        return Colors.red;

      default:
        return Colors.purple;
    }
  }
}
