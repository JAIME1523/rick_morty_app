
import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/ui/page/widget/widget.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_juegos/utils/utils.dart';

class ContentList extends StatelessWidget {
  const ContentList({
    Key? key,
    required this.character,
    required this.heightHero,
    required this.whiteHero,
    required this.heightCardBack,
    required this.whiteCardBack,
    required this.heightInfo,
    required this.whiteinfo,
  }) : super(key: key);

  final InfoCharacter character;
  final double heightHero;
  final double whiteHero;
  final double heightCardBack;
  final double whiteCardBack;
  final double heightInfo;
  final double whiteinfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: character.id,
          child: Container(
            // height: size.height * 0.5,
            // width: size.width * 0.7,
            height: heightHero,
            width: whiteHero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: FadeInImage.assetNetwork(
                        // fit: BoxFit.fitHeight,
                        placeholder: 'assets/loader.gif',
                        image: character.image)
                    .image,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          left: -15,
          child: CardBackground(
              // height: size.height * 0.13,
              // width: size.width * 0.70,
              height: heightCardBack,
              width: whiteCardBack,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: GetColorStatus.status(character.status))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          // height: size.height * 0.13,
                          // width: size.width * 0.5,
                          width: whiteinfo,
                          child: Text(
                            character.name,
                            maxLines: 1,
                            style: CustomStyleText.h2,
                          ),
                        ),
                      const  SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Gender: ',
                                style: CustomStyleText.subTitleCard.copyWith(
                                    color: CustomColors.backgroundColor,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              character.gender.name,
                              style: CustomStyleText.subTitleCard.copyWith(
                                  color:
                                      GetColorStatus.gender(character.gender),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
