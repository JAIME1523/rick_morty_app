import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CharcterGridPage extends StatelessWidget {
  final ResultEpisode episode;
  const CharcterGridPage({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppbarProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CharcterGridPageProvider(episode.characters),
          ),
        ],
        child: _BodyGrid(
          count: count,
          episode: episode,
        ));
  }
}

class _BodyGrid extends StatefulWidget {
  const _BodyGrid({
    Key? key,
    required this.count,
    required this.episode,
  }) : super(key: key);
  final ResultEpisode episode;

  final int count;
  @override
  State<_BodyGrid> createState() => _BodyGridState();
}

class _BodyGridState extends State<_BodyGrid> {
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<AppbarProvider>(context, listen: false).mostrar = false;
      } else {
        Provider.of<AppbarProvider>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppbarProvider>(context);
    final providerChacrterGrid = Provider.of<CharcterGridPageProvider>(context);

    return Scaffold(
      appBar: provider.mostrar
          ? AppBar(
              backgroundColor: CustomColors.backgroundColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(
                    Icons.arrow_back_ios,
                    // size: 20,
                  )),
              title: Column(
                children: [
                  Text('Episode:'),
                ],
              ),
            )
          : null,
      body: SafeArea(
          child: Stack(
        children: [
          providerChacrterGrid.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : providerChacrterGrid.chacterInfo.isEmpty
                  ? const Center(
                      child: Text('Sin informacion que mostrar'),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: provider.mostrar ? 30 : 0),
                      child: Center(
                          child: GridView.custom(
                        controller: controller,
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
                            (context, index) => _CharacterItem(index: index),
                            childCount:
                                providerChacrterGrid.chacterInfo.length),
                      )),
                    ),
          provider.mostrar
              ? Container(
                  height: 30,
                  width: double.infinity,
                  color: CustomColors.backgroundColor,
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.episode.name,
                    style: TextStyle(fontSize: 22),
                  ))
              : SizedBox()
        ],
      )),
    );
  }
}

class _CharacterItem extends StatelessWidget {
  final int index;

  const _CharacterItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerChacrterGrid = Provider.of<CharcterGridPageProvider>(context);
    final character = providerChacrterGrid.chacterInfo[index];
    return Container(
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
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}
