import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/provider/chacter_info_provider.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/ui/widgets/custom_botton.dart';
import 'package:catalogo_juegos/utils/utils.dart';

import 'widget/episode/episode_widget.dart';

class CharacterInfoPage extends StatelessWidget {
  const CharacterInfoPage({Key? key, required this.character})
      : super(key: key);
  final InfoCharacter character;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: SafeArea(
        child: Stack(
          children: [
            size.width <= 700
                ? _ImageHero(
                    character: character,
                    size: size,
                    height: size.height * 0.5,
                    width: double.infinity,
                    boxFit: BoxFit.fill,
                  )
                : _ImageHero(
                    character: character,
                    size: size,
                    height: size.height,
                    width: double.infinity,
                    boxFit: BoxFit.fill,
                  ),
            Positioned(
              bottom: 0,
              child: size.width <= 700
                  ? _Info(
                      size: size,
                      character: character,
                      height: size.height * 0.55,
                      width: size.width,
                    )
                  : _Info(
                      size: size,
                      character: character,
                      height: size.height * 0.3,
                      width: size.width,
                    ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.3)),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const FaIcon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
    required this.size,
    required this.character,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Size size;
  final InfoCharacter character;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // height: size.height * 0.51,
        // width: size.width,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: CustomColors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: FadeIn(
          delay: const Duration(milliseconds: 800),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  character.name,
                  style: CustomStyleText.h1.copyWith(fontSize: 33),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: GetColorStatus.status(character.status))),
                    const SizedBox(
                      width: 20,
                    ),
                    FaIcon(
                        GetGenderIcon.genderIcon(
                          character.gender,
                        ),
                        color: GetColorStatus.gender(character.gender)),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RowInfo(
                  tex1: 'Specie',
                  text2: character.species!,
                ),
                // const Spacer(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RowInfo(
                  tex1: 'Gender',
                  text2: character.gender.name,
                ),
                // const Spacer(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RowInfo(
                  tex1: 'Origen Location',
                  text2: character.origin.name,
                ),
                // const Spacer(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RowInfo(
                  tex1: 'Last known location',
                  text2: character.location.name,
                ),
                // const Spacer(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RowInfo(
                  tex1: 'Status',
                  text2: character.status.name,
                ),
                // Text(character.),
                // Spacer(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                CustomBotton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) {
                          return _ListEpisode(
                            character: character,
                          );
                        });
                  },
                  icon: Icons.ad_units,
                  text: 'Episodes',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListEpisode extends StatelessWidget {
  const _ListEpisode({
    Key? key,
    required this.character,
  }) : super(key: key);
  final InfoCharacter character;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => CharacterInfoProvider(character.episode),
      //  ChangeNotifierProvider<CharacterInfoProvider>.value(
      // value: CharacterInfoProvider(character.episode),

      child: Builder(builder: (context) {
        final characterInfoProvider =
            Provider.of<CharacterInfoProvider>(context);

        return SizedBox(
          height: 400,
          width: size.width,
          child: characterInfoProvider.isLoading
              ? Image.asset(fit: BoxFit.fill, 'assets/loading.gif')
              : FadeIn(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 400,
                    width: size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/fondo.jpg'))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child:
                              Text('List episodes', style: CustomStyleText.h1),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10, top: 5),
                            width: double.infinity,
                            height: 300,
                            child: ListView.builder(
                                itemCount: characterInfoProvider
                                    .chacterEpisode!.length,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemBuilder: (_, index) {
                                  EpisodesModelCharacter episode =
                                      characterInfoProvider.listEpisode[index];
                                  return FadeInLeft(
                                    delay: const Duration(milliseconds: 500),
                                    child: CardInfoEpisode(
                                        size: size, episode: episode),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}

class _ImageHero extends StatelessWidget {
  const _ImageHero({
    Key? key,
    required this.character,
    required this.size,
    required this.height,
    required this.width,
    required this.boxFit,
  }) : super(key: key);

  final InfoCharacter character;
  final Size size;
  final double height;
  final double width;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: character.id,
        child: Container(
          // height: size.height * 0.5,
          // width: double.infinity,
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              // scale: 2,
              fit: boxFit,
              image: FadeInImage.assetNetwork(
                      // imageScale: 1,
                      // fit: boxFit,
                      placeholder: 'assets/loader.gif',
                      image: character.image)
                  .image,
            ),
          ),
        ));
  }
}
