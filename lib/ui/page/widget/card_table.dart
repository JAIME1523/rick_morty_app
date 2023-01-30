import 'dart:ui';

import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const CardBackground(
      {Key? key, required this.child, this.width = 200, this.height = 180})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(71, 112, 110, 110),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
