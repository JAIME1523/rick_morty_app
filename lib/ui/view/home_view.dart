import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/page/character_info_page.dart';
import 'package:catalogo_juegos/ui/page/widget/widget.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getCharacterProvider = Provider.of<GetCharacterProvider>(context);

    final size = MediaQuery.of(context).size;
    return Container(
        child: getCharacterProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home',
                      style: CustomStyleText.h1,
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const Spacer(),

                    _ViewCharacter(
                      size: size,
                      listCharacter: getCharacterProvider.listInfo,
                      getCharacterProvider: getCharacterProvider,
                    ),
                    const Spacer(),
                    Text(
                      'Recommend to you',
                      style: CustomStyleText.subTile1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _ViewIconsChacracter(
                        listCharacter: getCharacterProvider.listRecomend),
                    Spacer()
                  ],
                ),
              ));
  }
}



class _ViewIconsChacracter extends StatelessWidget {
  const _ViewIconsChacracter({
    Key? key,
    required this.listCharacter,
  }) : super(key: key);
  final List<InfoCharacter> listCharacter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listCharacter.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (_) =>
                          CharacterInfoPage(character: listCharacter[index])));
            },
            child: ImageCharacterIcon(
              character: listCharacter[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 85,
            width: 25,
            // color: Colors.white,
          );
        },
      ),
    );
  }
}

class _ViewCharacter extends StatefulWidget {
  const _ViewCharacter({
    Key? key,
    required this.size,
    required this.listCharacter,
    required this.getCharacterProvider,
  }) : super(key: key);

  final Size size;
  final List<InfoCharacter> listCharacter;
  final GetCharacterProvider getCharacterProvider;

  @override
  State<_ViewCharacter> createState() => _ViewCharacterState();
}

class _ViewCharacterState extends State<_ViewCharacter> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      // print(scrollController.position.pixels);
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        await widget.getCharacterProvider.getNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.width < 700
          ? widget.size.height * 0.5
          : widget.size.height * 0.41,
      width: widget.size.width,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.listCharacter.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => CharacterInfoPage(
                            character: widget.listCharacter[index])));
              },
              child: widget.size.width < 700
                  ? ContentList(
                      character: widget.listCharacter[index],
                      heightHero: widget.size.height * 0.5,
                      whiteHero: widget.size.width * 0.7,
                      heightCardBack: widget.size.height > 576.0
                          ? widget.size.height * 0.13
                          : widget.size.height * 0.15,
                      whiteCardBack: widget.size.width * 0.70,
                      whiteinfo: widget.size.width * 0.5,
                      heightInfo: widget.size.height * 0.13,
                    )
                  : ContentList(
                      character: widget.listCharacter[index],
                      heightHero: widget.size.height * 0.5,
                      whiteHero: widget.size.width * 0.5,
                      heightCardBack: widget.size.height * 0.18,
                      whiteCardBack: widget.size.width * 0.5,
                      whiteinfo: widget.size.width * 0.4,
                      heightInfo: widget.size.height * 0.13,
                    ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 85,
            width: 25,
            // color: Colors.white,
          );
        },
      ),
    );
  }
}
