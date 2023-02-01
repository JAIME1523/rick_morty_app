import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/cupertino.dart';

class CheckBoxVIew extends StatelessWidget {
  const CheckBoxVIew({
    Key? key,
    required this.getCharacterProvider,
  }) : super(key: key);

  final GetCharacterProvider getCharacterProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Change view'),
        CupertinoSwitch(
            value: getCharacterProvider.changeView,
            activeColor: CustomColors.blueColor,
            onChanged: (value) {
              getCharacterProvider.changeView = value;
            }),
      ],
    );
  }
}
