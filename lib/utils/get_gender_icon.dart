
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:catalogo_juegos/model/models.dart';

class GetGenderIcon {
  static genderIcon(gender) {
    switch (gender) {
      case Gender.UNKNOWN:
        return FontAwesomeIcons.question;
      case Gender.FEMALE:
        return FontAwesomeIcons.personDress;
      case Gender.MALE:
        return FontAwesomeIcons.person;

      case Gender.GENDERLESS:
        return FontAwesomeIcons.genderless;

      default:
        return FontAwesomeIcons.user;
    }
  }
}
