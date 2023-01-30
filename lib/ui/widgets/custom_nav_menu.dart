import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavButto {
  // final Function? onPressed;
  //para ponder mandar a llamar la función en la seccion de _CustomNavMenuButtom
  final VoidCallback onPressed;
  final IconData icon;
  final String tilte;

  CustomNavButto(
      {required this.tilte, required this.onPressed, required this.icon});
}

class CustomNavMenu extends StatelessWidget {
  const CustomNavMenu({
    Key? key,
    this.mostar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  }) : super(key: key);
  final Color backgroundColor;
  final Color activeColor; //black
  final Color inactiveColor; //blue
  final bool mostar;
  final List items;

  // final List items = [
  //   CustomNavButto(
  //       icon: Icons.pie_chart,
  //       onPressed: () {
  //         print('pie_chart');
  //       }),
  //   CustomNavButto(
  //       icon: Icons.search,
  //       onPressed: () {
  //         print('search');
  //       }),
  //   CustomNavButto(
  //       icon: Icons.notifications,
  //       onPressed: () {
  //         print('notifications');
  //       }),
  //   CustomNavButto(
  //       icon: Icons.supervised_user_circle,
  //       onPressed: () {
  //         print('supervised_user_circle');
  //       }),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

            return _PrinteredMenuBackground(
              child: _MenuItems(menuItems: items),
            );
          },
        ),
      ),
    );
  }
}

class _PrinteredMenuBackground extends StatelessWidget {
  const _PrinteredMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
              top: BorderSide(color: CustomColors.bottomNavigationBarColor))
          // borderRadius: const BorderRadius.all(Radius.circular(100)),
          // boxShadow: const <BoxShadow>[
          //   BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          // ]
          ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  final List menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) => _CustomNavMenuButtom(
                  index: index,
                  item: menuItems[index],
                )));
  }
}

class _CustomNavMenuButtom extends StatelessWidget {
  const _CustomNavMenuButtom(
      {Key? key, required this.index, required this.item})
      : super(key: key);
  final int index;
  final CustomNavButto item;
  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        //se pone el listen false para que no redibuje todo el widget
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;

        itemSeleccionado == index ? null : item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 4),
        width: itemSeleccionado == index ? 95 : 30,
        height: 40,
        // color: Colors.red,
        decoration: itemSeleccionado == index
            ? const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF17181c),
              )
            : null,

        child: Row(
          children: [
            const Spacer(),
            Icon(item.icon,
                size: (itemSeleccionado == index) ? 18 : 14,
                color: (itemSeleccionado == index)
                    ? Provider.of<_MenuModel>(context).activeColor
                    : Provider.of<_MenuModel>(context).inactiveColor),
            const Spacer(),
            itemSeleccionado == index
                ? Text(
                    item.tilte,
                    style: TextStyle(
                        fontSize: 13,
                        color: Provider.of<_MenuModel>(context).activeColor),
                  )
                : Container(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.white; //black
  Color inactiveColor = Colors.blueGrey;
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
