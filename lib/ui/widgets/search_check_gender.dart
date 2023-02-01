import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckGender extends StatelessWidget {
  const CheckGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final menuProvider = Provider.of<FiltrerMenuSearchProvider>(context );

      return SingleChildScrollView(
        child: Column(
      children: List.generate(
          Gender.values.length,
          (index) => SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Checkbox(
                        value: menuProvider.itemSeleccionadoGender == index
                            ? true
                            : false,
                        onChanged: (value) {
                          if (menuProvider.itemSeleccionadoGender ==
                              index) {
                            menuProvider.itemSeleccionadoGender = null;
                            Provider.of<SearchQuestionProvider>(context,
                                    listen: false)
                                .gender = '';
                          } else {
                            menuProvider.itemSeleccionadoGender = index;
                            Provider.of<SearchQuestionProvider>(context,
                                    listen: false)
                                .gender = Gender.values[index].name;
                          }
                        }),
                    Text(Gender.values[index].name)
                  ],
                ),
              )),
        ),
      );
    });
  }
}

// class _FiltrerSearchGenderProvider with ChangeNotifier {
//   dynamic _itemSeleccionado;

//   dynamic get itemSeleccionado => _itemSeleccionado;

//   set itemSeleccionado(dynamic index) {
//     print(index);
//     _itemSeleccionado = index;
//     notifyListeners();
//   }
// }
