
import 'package:flutter/material.dart';
import 'package:catalogo_juegos/model/models.dart';

class ImageCharacterIcon extends StatelessWidget {
  const ImageCharacterIcon({
    Key? key,
    required this.character,
  }) : super(key: key);
  final InfoCharacter character;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 80,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: FadeInImage.assetNetwork(
                      fit: BoxFit.fitHeight,
                      placeholder: 'assets/loader.gif',
                      image: character.image)
                  .image)),
    );
  }
}
