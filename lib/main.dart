import 'package:catalogo_juegos/api/api_character.dart';
import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/page/home_page.dart';
import 'package:catalogo_juegos/ui/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  ApiCharacter.configureDio();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GetCharacterProvider()),
    ChangeNotifierProvider(create: (_) => NavProvider()),
    ChangeNotifierProvider( create: (_) => EpisodeViewProvider(),),
    ChangeNotifierProvider(
      create: (_) => SearchQuestionProvider(),)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: CustomColors.backgroundColor),
    );
  }
}
