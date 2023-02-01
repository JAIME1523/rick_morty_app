import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => FiltrerMenuSearchProvider(),
        child: Builder(builder: (context) {
          final menuProvider = Provider.of<FiltrerMenuSearchProvider>(context);
          // final size = MediaQuery.of(context).size;
          return SizedBox(
            //
            height: 300,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomBotton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Ok',
                      icon: FontAwesomeIcons.check),
                ),
                Expanded(
                    child: menuProvider.viewSelect
                        ? const SearchCheckStaus()
                        : const CheckGender()),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Color(0xFF424242),
                      ),
                      child: CustomNavMenu(
                          backgroundColor: const Color(0xFF424242),
                          activeColor: CustomColors.blueColor,
                          items: [
                            CustomNavButto(
                                icon: FontAwesomeIcons.marsAndVenusBurst,
                                tilte: 'gender',
                                onPressed: () {
                                  menuProvider.viewSelect =
                                      !menuProvider.viewSelect;
                                }),
                            CustomNavButto(
                                icon: FontAwesomeIcons.skull,
                                tilte: 'Status',
                                onPressed: () {
                                  menuProvider.viewSelect =
                                      !menuProvider.viewSelect;
                                }),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}

class FiltrerMenuSearchProvider with ChangeNotifier {
  bool _viewSelect = false;

  bool get viewSelect => _viewSelect;

  set viewSelect(bool index) {
    _viewSelect = index;
    notifyListeners();
  }

  dynamic _itemSeleccionadoGender;

  dynamic get itemSeleccionadoGender => _itemSeleccionadoGender;

  set itemSeleccionadoGender(dynamic index) {
    
    _itemSeleccionadoGender = index;
    notifyListeners();
  }

  dynamic _itemSeleccionadoStatus;

  dynamic get itemSeleccionadoStatus => _itemSeleccionadoStatus;

  set itemSeleccionadoStatus(dynamic index) {
    _itemSeleccionadoStatus = index;
    notifyListeners();
  }
}
