// import 'package:catalogo_juegos/api/api_character.dart';
// import 'package:catalogo_juegos/provider/get_chacters_providers.dart';
// import 'package:catalogo_juegos/ui/widgets/custom_cadar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final getCharacterProvider = Provider.of<GetCharacterProvider>(context);
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   getCharacterProvider.getNextPage();
//                 },
//                 icon: Icon(Icons.add))
//           ],
//         ),
//         body: SafeArea(
//             child: getCharacterProvider.isLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: getCharacterProvider.listInfo.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return CustomCard(
//                           character: getCharacterProvider.listInfo[index]);
//                     },
//                   )));
//   }
// }
