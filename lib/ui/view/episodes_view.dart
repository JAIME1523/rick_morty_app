import 'package:catalogo_juegos/provider/view/episode_view_provider.dart';
import 'package:catalogo_juegos/ui/page/page.dart';
// import 'package:catalogo_juegos/ui/page/character_grid_page.dart';

import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      final providerEpisode = Provider.of<EpisodeViewProvider>(context);
      return providerEpisode.listEpisode.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              height: size.height,
              width: size.width,
              child: ListView(
                children: [
                  Text(
                    'LIST EPISODES',
                    textAlign: TextAlign.center,
                    style: CustomStyleText.h1,
                  ),
                  ...providerEpisode.listEpisode.map(
                    (episode) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding:
                         const   EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(colors: [
                               Color(0xFF6989F5),
                               Color(0xFF906EF5)
                            ])),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RowInfo(
                                tex1: 'Name',
                                text2: episode.name,
                                styleTex1: CustomStyleText.cardInfoTexth1
                                    .copyWith(color:const Color(0xff241b79)),
                                styleTex2: CustomStyleText.cardInfoText
                                    .copyWith(fontSize: 17),
                              ),
                              RowInfo(
                                tex1: 'Episode',
                                text2: episode.episode,
                                styleTex1: CustomStyleText.cardInfoTexth1
                                    .copyWith(color: const Color(0xff241b79)),
                              ),
                              RowInfo(
                                tex1: 'Air date',
                                text2: episode.airDate,
                                styleTex1: CustomStyleText.cardInfoTexth1
                                    .copyWith(color:const  Color(0xff241b79)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomBotton(
                                  color: CustomColors.backgroundColor,
                                  width: 200,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (_) =>
                                                CharcterGridPage(episode:episode,)));
                                  },
                                  text: 'Episode characters',
                                  icon: FontAwesomeIcons.person)
                            ],
                          ),
                        )),
                  ),
                  Container(
                      width: 160,
                      // padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomBotton(
                          onPressed: () {
                            providerEpisode.getNextPageEpisode();
                          },
                          text: 'load more chapters',
                          icon: Icons.add_box))
                ],
              ));
    });
  }
}

// ignore: unused_element
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
