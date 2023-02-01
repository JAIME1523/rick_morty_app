
import 'package:catalogo_juegos/ui/tools/custom_style_text.dart';
import 'package:catalogo_juegos/utils/get_color_status.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_juegos/model/models.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.character}) : super(key: key);
  final InfoCharacter character;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color:const Color(0xFF3c3e44)),
      child: Row(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18)),
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FadeInImage.assetNetwork(
                            fit: BoxFit.fitHeight,
                            placeholder: 'assets/loader.gif',
                            image: character.image)
                        .image)
                        
                        ),
            // height: 230,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  character.name,
                  style: CustomStyleText.titleTextCard,
                ),
                Row(
                  children: [
                    Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: GetColorStatus.status(character.status))),
                    Text(
                      character.status.name,
                      style: CustomStyleText.nameText,
                    ),
                    Text(
                      '-',
                      style: CustomStyleText.nameText,
                    ),
                    Expanded(
                      child: Text(
                        character.species!,
                        style: CustomStyleText.nameText,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Text('Last known location:',
                    style: CustomStyleText.nameTextDescrip),
                Text(
                  character.location.name,
                  style: CustomStyleText.nameText,
                ),
                Text('Origen:', style: CustomStyleText.nameTextDescrip),
                Text(
                  character.origin.name,
                  style: CustomStyleText.nameText,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
