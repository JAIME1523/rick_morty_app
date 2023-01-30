
import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';

class CardInfoEpisode extends StatelessWidget {
  const CardInfoEpisode({
    Key? key,
    required this.size,
    required this.episode,
  }) : super(key: key);

  final Size size;
  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 15),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        height: 90,
        width: size.width,
        decoration: BoxDecoration(
            color: CustomColors.backgroundColor,
            borderRadius:
                BorderRadius.circular(15),
            border: Border.all(
                color: Colors.white,
                width: 0.5)),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color:
                              Colors.white))),
              width: 100,
              child: Column(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Name: ',
                    style: CustomStyleText
                        .cardInfoTexth1
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Text(
                      episode.name,
                      style: CustomStyleText
                          .cardInfoText
                          .copyWith(
                              fontSize: 14),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding:
                 const  EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceEvenly,
                children: [
                  _RowInfo2(
                      tex1: 'Air date',
                      text2: episode.airDate),
                  _RowInfo2(
                      tex1: 'Episode ',
                      text2: episode.episode)
                ],
              ),
            ))
          ],
        ));
  }
}


class _RowInfo2 extends StatelessWidget {
  const _RowInfo2({
    Key? key,
    required this.tex1,
    required this.text2,
  }) : super(key: key);

  final String tex1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$tex1: ',
          style: CustomStyleText.cardInfoTexth1.copyWith(fontSize: 14),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            text2,
            style: CustomStyleText.cardInfoText.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}