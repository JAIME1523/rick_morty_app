import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBotton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  const CustomBotton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:CustomColors.yellowColor,
          foregroundColor: const Color(0xFF81c1f8),
          // shadowColor: Colors.white,

          elevation: 5,
        ),
        onPressed: () {
          onPressed();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Episodes ',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
            ),
            SizedBox(
              width: 8,
            ),
            FaIcon(
              FontAwesomeIcons.tv,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
        ));
  }
}
