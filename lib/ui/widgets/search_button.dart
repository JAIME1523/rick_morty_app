import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:catalogo_juegos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final result = await showSearch(
              context: context, delegate: SearchCharacterDelegate());
          if (result == null) return;
        },
        icon:const FaIcon(Icons.search_outlined, size: 35,),
        
        color: CustomColors.blueColor);
  }
}
