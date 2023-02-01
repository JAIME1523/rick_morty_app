import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/page/character_info_page.dart';
import 'package:catalogo_juegos/ui/page/widget/widget.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getCharacterProvider = Provider.of<GetCharacterProvider>(context);
    final size = MediaQuery.of(context).size;
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    return Container(
      child: getCharacterProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : getCharacterProvider.changeView
              ? _ListVIewGrid(
                  count: count, getCharacterProvider: getCharacterProvider)
              : _ListViewSepared(
                  size: size, getCharacterProvider: getCharacterProvider),
    );
    // _ListViewSepared(size: size, getCharacterProvider: getCharacterProvider));
  }
}

class _ListVIewGrid extends StatefulWidget {
  const _ListVIewGrid({
    Key? key,
    required this.count,
    required this.getCharacterProvider,
  }) : super(key: key);

  final int count;
  final GetCharacterProvider getCharacterProvider;

  @override
  State<_ListVIewGrid> createState() => _ListVIewGridState();
}

class _ListVIewGridState extends State<_ListVIewGrid> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      // print(scrollController.position.pixels);
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        widget.getCharacterProvider.showButton = true;
      } else {
        widget.getCharacterProvider.showButton = false;
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
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      padding: const EdgeInsets.only(
        top: 20,
      ),
      width: size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home',
                  style: CustomStyleText.h1,
                ),
                const SearchButton(),
                CheckBoxVIew(getCharacterProvider: widget.getCharacterProvider)
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  // height: size.height - 145,
                  width: size.width,
                  child: Center(
                      child: GridView.custom(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: SliverWovenGridDelegate.count(
                      crossAxisCount: widget.count,
                      pattern: [
                        const WovenGridTile(1),
                        const WovenGridTile(
                          5 / 7,
                          crossAxisRatio: 0.9,
                          // alignment: AlignmentDirectional.,
                        ),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => CharacterInfoPage(
                                            character: widget
                                                .getCharacterProvider
                                                .listInfo[index])));
                              },
                              child: CharacterItemGrid(
                                index: index,
                                chacterInfo:
                                    widget.getCharacterProvider.listInfo,
                              ),
                            ),
                        childCount:
                            widget.getCharacterProvider.listInfo.length),
                  )),
                ),
                Positioned(
                  bottom: -154,
                  right: size.width * 0.35,
                  child: widget.getCharacterProvider.showButton
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 160),
                          width: 136,
                          height: 45,
                          child: CustomBotton(
                              onPressed: () {
                                widget.getCharacterProvider.getNextPage();
                              },
                              text: 'Load more',
                              icon: Icons.add),
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListViewSepared extends StatelessWidget {
  const _ListViewSepared({
    Key? key,
    required this.size,
    required this.getCharacterProvider,
  }) : super(key: key);

  final Size size;
  final GetCharacterProvider getCharacterProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Home',
                style: CustomStyleText.h1,
              ),
              const SearchButton(),
              CheckBoxVIew(getCharacterProvider: getCharacterProvider)
            ],
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
          const Spacer(),
          _ViewIconsChacracter(
              listCharacter: getCharacterProvider.listRecomend),
          const Spacer()
        ],
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.size.width < 700
            ? widget.size.height * 0.5
            : widget.size.height * 0.41,
        width: widget.size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...widget.listCharacter.map((character) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) =>
                                    CharacterInfoPage(character: character)));
                      },
                      child: widget.size.width < 700
                          ? ContentList(
                              character: character,
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
                              character: character,
                              heightHero: widget.size.height * 0.5,
                              whiteHero: widget.size.width * 0.5,
                              heightCardBack: widget.size.height * 0.18,
                              whiteCardBack: widget.size.width * 0.5,
                              whiteinfo: widget.size.width * 0.4,
                              heightInfo: widget.size.height * 0.13,
                            )),
                )),
            widget.getCharacterProvider.characterResponse!.info.next != null
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [Text('Load'), Icon(Icons.add)],
                        )),
                  ],
                )
                : Container()
          ],
        )

        // ListView.separated(
        //   // physics: const BouncingScrollPhysics(
        //   //     parent: AlwaysScrollableScrollPhysics()),
        //   controller: scrollController,
        //   scrollDirection: Axis.horizontal,
        //   itemCount: widget.listCharacter.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               CupertinoPageRoute(
        //                   builder: (_) => CharacterInfoPage(
        //                       character: widget.listCharacter[index])));
        //         },
        //         child: widget.size.width < 700
        //             ? ContentList(
        //                 character: widget.listCharacter[index],
        //                 heightHero: widget.size.height * 0.5,
        //                 whiteHero: widget.size.width * 0.7,
        //                 heightCardBack: widget.size.height > 576.0
        //                     ? widget.size.height * 0.13
        //                     : widget.size.height * 0.15,
        //                 whiteCardBack: widget.size.width * 0.70,
        //                 whiteinfo: widget.size.width * 0.5,
        //                 heightInfo: widget.size.height * 0.13,
        //               )
        //             : ContentList(
        //                 character: widget.listCharacter[index],
        //                 heightHero: widget.size.height * 0.5,
        //                 whiteHero: widget.size.width * 0.5,
        //                 heightCardBack: widget.size.height * 0.18,
        //                 whiteCardBack: widget.size.width * 0.5,
        //                 whiteinfo: widget.size.width * 0.4,
        //                 heightInfo: widget.size.height * 0.13,
        //               ));
        //   },
        //   separatorBuilder: (BuildContext context, int index) {
        //     return const SizedBox(
        //       height: 85,
        //       width: 25,
        //       // color: Colors.white,
        //     );
        //   },
        // ),
        );
  }
}
