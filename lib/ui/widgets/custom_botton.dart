import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBotton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final double width;
  final Color? color;
  const CustomBotton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.width = double.infinity,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? CustomColors.blueColor,
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
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                width: 8,
              ),
              FaIcon(
                icon,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
