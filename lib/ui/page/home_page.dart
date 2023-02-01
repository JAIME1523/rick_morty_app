import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/ui/view/view.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    return Scaffold(
      // backgroundColor: CustomColors.backgroundColor,
      // bottomNavigationBar: Container(
      //   width: double.infinity,
      //   height: 60,
      //   color: Colors.amber,
      // ),

      body: SafeArea(child: viewSwitch(navProvider.viewStatus)),
      bottomNavigationBar: const _Nav(),
    );
  }

  viewSwitch(ViewsStatus view) {
    switch (view) {
      case ViewsStatus.home:
        return const HomeView();

      case ViewsStatus.episode:
        return const EpisodesView();
      case ViewsStatus.location:
        return const LocationsView();
      case ViewsStatus.gratitude:
        return const GratitudeView();

      default:
        const HomeView();
    }
  }
}

class _Nav extends StatelessWidget {
  const _Nav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(listen: false, context);

    return CustomNavMenu(
        // backgroundColor: CustomColors.backgroundColor,
        // inactiveColor: CustomColors.bottomNavigationBarColor,
        backgroundColor: CustomColors.backgroundColor,
        inactiveColor: CustomColors.purpleColor,

        // const Color(0xff6989F5),
        //             const Color(0xff906EF5)
        activeColor: CustomColors.blueColor,
        items: [
          CustomNavButto(
              icon: FontAwesomeIcons.house,
              tilte: 'Home',
              onPressed: () {
                navProvider.viewStatus = ViewsStatus.home;
              }),
          CustomNavButto(
              icon: FontAwesomeIcons.tv,
              tilte: 'Episode',
              onPressed: () {
                navProvider.viewStatus = ViewsStatus.episode;
              }),
          // CustomNavButto(
          //     icon: FontAwesomeIcons.earthAmericas,
          //     tilte: 'Location',
          //     onPressed: () {
          //       navProvider.viewStatus = ViewsStatus.location;
          //     }),
          CustomNavButto(
              icon: FontAwesomeIcons.a,
              tilte: 'gratitude',
              onPressed: () {
                navProvider.viewStatus = ViewsStatus.gratitude;
              }),
        ]);
  }
}
