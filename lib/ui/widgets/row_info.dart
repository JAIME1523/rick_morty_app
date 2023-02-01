import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({
    Key? key,
    required this.tex1,
    required this.text2,
    this.styleTex1,
    this.styleTex2,
  }) : super(key: key);

  final String tex1;
  final String text2;
  final TextStyle? styleTex1;
  final TextStyle? styleTex2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$tex1: ', style: styleTex1 ?? CustomStyleText.cardInfoTexth1),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(text2, style: styleTex2 ?? CustomStyleText.cardInfoText),
        ),
      ],
    );
  }
}
