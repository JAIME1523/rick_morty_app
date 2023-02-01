import 'dart:ui';

import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/utils/utils.dart';
import 'package:flutter/material.dart';

class CharacterItemGrid extends StatelessWidget {
  final int index;
  final List<InfoCharacter> chacterInfo;

  const CharacterItemGrid({
    Key? key,
    required this.index,
    required this.chacterInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final character = chacterInfo[index];
    return Hero(
      tag: character.id,
      child: Container(
        width: double.infinity,
        // height: ,
        decoration: BoxDecoration(
          image: DecorationImage(
            // scale: 2,
            fit: BoxFit.fill,
            image: FadeInImage.assetNetwork(
                    // imageScale: 1,
                    // fit: boxFit,
                    placeholder: 'assets/loader.gif',
                    image: character.image)
                .image,
          ),
          color: Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                // color: Colors.red,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    // height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(71, 112, 110, 110),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            // height: size.height * 0.13,
                            // width: size.width * 0.5,
                            // width: whiteinfo,
                            child: Text(
                              character.name,
                              maxLines: 1,
                              style: CustomStyleText.h2,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          size.width < 350
                              ? Container()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Gender: ',
                                        style: CustomStyleText.subTitleCard
                                            .copyWith(
                                                color: CustomColors
                                                    .backgroundColor,
                                                fontWeight: FontWeight.bold)),
                                    Text(
                                      character.gender.name,
                                      style: CustomStyleText.subTitleCard
                                          .copyWith(
                                              color: GetColorStatus.gender(
                                                  character.gender),
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
