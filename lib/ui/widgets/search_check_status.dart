import 'package:catalogo_juegos/model/models.dart';
import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCheckStaus extends StatelessWidget {
  const SearchCheckStaus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final menuProvider = Provider.of<FiltrerMenuSearchProvider>(context);

      return SingleChildScrollView(
        child: Column(
      children: List.generate(
          Status.values.length,
          (index) => SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Checkbox(
                        value: menuProvider.itemSeleccionadoStatus == index
                            ? true
                            : false,
                        onChanged: (value) {
                          if (menuProvider.itemSeleccionadoStatus ==
                              index) {
                            menuProvider.itemSeleccionadoStatus = null;
                            Provider.of<SearchQuestionProvider>(context,
                                    listen: false)
                                .status = '';
                          } else {
                            menuProvider.itemSeleccionadoStatus = index;
                            Provider.of<SearchQuestionProvider>(context,
                                    listen: false)
                                .status = Status.values[index].name;
                          }
                        }),
                    Text(Status.values[index].name)
                  ],
                ),
              )),
        ),
      );
    });
  }
}
